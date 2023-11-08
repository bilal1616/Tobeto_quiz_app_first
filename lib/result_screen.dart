import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<String> questions; // Soruların listesi
  final List<String> selectedAnswers; // Kullanıcının seçtiği cevapların listesi
  final List<String> correctAnswers; // Doğru cevapların listesi

  const ResultScreen({
    Key? key, // Widget'in key özelliği
    required this.questions, // Soruların listesi
    required this.selectedAnswers, // Kullanıcının seçtiği cevapların listesi
    required this.correctAnswers, // Doğru cevapların listesi
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //bir Flutter widget sınıfının `build` metodunu yeniden tanımlar. Bu metot, widget'in görünümünü oluşturur.
    final int totalQuestions = questions.length; // Toplam soru sayısı ve soru listesinin uzunluğunu kontrol eder.
    final int correctCount = selectedAnswers.where((answer) {
      final index = selectedAnswers.indexOf(answer);
      return answer == correctAnswers[index];
    }).length; // Yukarıdaki satır, doğru cevap sayısını hesaplar ve `correctCount` adlı bir değişkene atar.

    final int incorrectCount = totalQuestions - correctCount; // Yanlış cevap sayısı

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white, // Doğru cevap sayısı kutusunun arka plan rengi
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Doğru Cevap Sayısı : $correctCount",
                    style: TextStyle(
                      fontSize: 14.75,
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Doğru cevap sayısı yazı rengi
                    ),
                  ),
                ),
                SizedBox(width: 16), // Aralık ekledik
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white, // Yanlış cevap sayısı kutusunun arka plan rengi
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Yanlış Cevap Sayısı : $incorrectCount",
                    style: TextStyle(
                      fontSize: 14.75,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Yanlış cevap sayısı yazı rengi
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: List.generate(questions.length, (index) {
                final question = questions[index]; // Soru metni
                final selectedAnswer = selectedAnswers[index]; // Kullanıcının seçtiği cevap.
                final isCorrect = selectedAnswer == correctAnswers[index]; // Cevabın doğruluğunu kontrol eder.
                final correctAnswer = correctAnswers[index]; // Cevapları Ekrana yazar.

                return Card(
                color: isCorrect
                    ? Colors.transparent
                    : Colors.transparent, // Doğru cevap, yanlış cevap arka plan rengi
                child: ListTile(
                  title: Text(
                    question,
                    style: TextStyle(fontSize: 14.75, color: Colors.white),
                  ),
                  subtitle: Text(
                    // Yanlış cevap verildiyse, verilen cevabı ve doğru cevabı ayrı ayrı satırlara yaz
                    isCorrect ? "Doğru Cevap: $selectedAnswer" : "Seçilen Cevap: ${selectedAnswer}\nDoğru Cevap: $correctAnswer",
                    style: TextStyle(fontSize: 14.75, color: Colors.white),
                  ),
                  leading: isCorrect ? Icon(Icons.check, color: Colors.green) // Doğru cevap işareti
                      : Icon(Icons.close, color: Colors.red), // Yanlış cevap işareti
                ),
              );

              }),
            ),
            SizedBox(height: 18),
            ElevatedButton.icon(
              onPressed: () {
                // Yeniden başlat düğmesine tıklanınca uygulamayı baştan başlatır.
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.arrow_right_alt), // Düğme ikonu
              label: const Text(
                "Yeniden Başla",
                style: TextStyle(fontSize: 14.75),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white, // Yazı rengi
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10), // Kenar boşluğu
              ),
            ),
          ],
        ),
      ),
    );
  }
}
