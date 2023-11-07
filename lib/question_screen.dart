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
  // QuizQuestions sınıfından bir nesne oluşturulur.
  final quizQuestions = QuizQuestions();
  List<QuizQuestion> questions = [];
  int currentQuestionIndex = 0; // Şu anki sorunun indeksi
  int correctAnswers = 0; // Doğru cevap sayısı

  @override
  void initState() {
    super.initState();
    // Soruları almak için 'quizQuestions' nesnesini kullanır.
    questions = quizQuestions.getQuestions();
  }

  // Kullanıcının seçtiği cevapları saklamak için bir liste oluşturulur.
  List<String> selectedAnswers = [];

  // Cevabın doğruluğunu kontrol eden işlev
  void checkAnswer(String selectedAnswer) {
    // Seçilen cevap doğruysa doğru cevap sayısını artırır.
    if (questions[currentQuestionIndex].correctAnswer == selectedAnswer) {
      setState(() {
        correctAnswers++;
      });
    }

    // Eğer daha fazla soru varsa bir sonraki soruya geçer, aksi takdirde sonuç ekranına yönlendirir.
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // Soru metinlerini, seçilen cevapları ve doğru cevapları içeren sonuç ekranına yönlendirir.
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

    // Seçilen cevapları saklamak için listeye ekler.
    selectedAnswers.add(selectedAnswer);
  }

  @override
  Widget build(BuildContext context) {
    // Şu anki soruyu alır.
    final question = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0), // Soru metni etrafına biraz boşluk ekler.
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
                final option = String.fromCharCode(65 + index); // A, B, C, D gibi seçenek harfini oluşturur.

                return Column(
                  children: [
                    Container(
                      height: 40,
                      margin: const EdgeInsets.all(1.0), // Cevap butonlarına biraz boşluk ekler.
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
