import 'package:flutter/material.dart';
import 'package:quiz_app_workshop/data/questions.dart';
import 'package:quiz_app_workshop/models/quiz_questions.dart';

void main() {
  runApp(const MaterialApp(home: StartScreen()));
}

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/image.jpg", width: 250),
            const Text(
              "Quiz App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionScreen()),
                );
              },
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
                "Start",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final quizQuestions = QuizQuestions();
  List<QuizQuestion> questions = [];
  int currentQuestionIndex = 0;
  int correctAnswers = 0;

  @override
  void initState() {
    super.initState();
    questions = quizQuestions.getQuestions();
  }

  void checkAnswer(String selectedAnswer) {
    if (questions[currentQuestionIndex].correctAnswer == selectedAnswer) {
      setState(() {
        correctAnswers++;
      });
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(correctAnswers: correctAnswers),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Soru ${currentQuestionIndex + 1}: ${question.question}",
              style: TextStyle(fontSize: 15),
            ),
            Column(
              children: question.answers.asMap().entries.map((entry) {
                final index = entry.key;
                final answer = entry.value;
                final option = String.fromCharCode(65 + index);

                return ElevatedButton(
                  onPressed: () {
                    checkAnswer(answer);
                  },
                  child: Text(
                    "$option) $answer",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int correctAnswers;

  const ResultScreen({Key? key, required this.correctAnswers}) 
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tebrikler, $correctAnswers doğru cevapladınız!",
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
                "Yeniden Başla",
                style: TextStyle(fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
