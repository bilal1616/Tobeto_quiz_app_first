import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<String> questions;
  final List<String> selectedAnswers;
  final List<String> correctAnswers;

  const ResultScreen({
    Key? key,
    required this.questions,
    required this.selectedAnswers,
    required this.correctAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int totalQuestions = questions.length;
    final int correctCount = selectedAnswers.where((answer) {
      final index = selectedAnswers.indexOf(answer);
      return answer == correctAnswers[index];
    }).length;

    final int incorrectCount = totalQuestions - correctCount;

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white, // Doğru cevap sayısı yeşil renk
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Doğru Cevap Sayısı : $correctCount",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(width: 16), // Aralık ekledik
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white, // Yanlış cevap sayısı kırmızı renk
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Yanlış Cevap Sayısı : $incorrectCount",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: List.generate(questions.length, (index) {
                final question = questions[index];
                final selectedAnswer = selectedAnswers[index];
                final isCorrect = selectedAnswer == correctAnswers[index];

                return Card(
                  color: isCorrect ? Colors.green : Colors.red,
                  child: ListTile(
                    title: Text(
                      question,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    subtitle: Text(
                      isCorrect ? "Doğru Cevap" : "Yanlış Cevap",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    leading: isCorrect
                        ? Icon(Icons.check, color: Colors.white)
                        : Icon(Icons.close, color: Colors.white),
                  ),
                );
              }),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
                "Yeniden Başla",
                style: TextStyle(fontSize: 16),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
