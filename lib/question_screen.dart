import 'package:flutter/material.dart';
import 'package:quiz_app_workshop/data/questions.dart';
import 'package:quiz_app_workshop/models/quiz_questions.dart';
import 'package:quiz_app_workshop/result_screen.dart';

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

  List<String> selectedAnswers = [];

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
      final List<String> questionTexts = questions.map((q) => q.question).toList();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            questions: questionTexts,
            selectedAnswers: selectedAnswers,
            correctAnswers: questions.map((q) => q.correctAnswer).toList(),
          ),
        ),
      );
    }

    selectedAnswers.add(selectedAnswer);
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0), // Soru etrafına padding ekledik
              child: Text(
                "Soru ${currentQuestionIndex + 1}: ${question.question}",
                style: TextStyle(fontSize: 19, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: question.answers.asMap().entries.map((entry) {
                final index = entry.key;
                final answer = entry.value;
                final option = String.fromCharCode(65 + index);

                return Column(
                  children: [
                    Container(
                      height: 40,
                      margin: const EdgeInsets.all(1.0), // Cevap butonlarına margin ekledik
                      child: ElevatedButton(
                        onPressed: () {
                          checkAnswer(answer);
                        },
                        child: Text(
                          "$option) $answer",
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
