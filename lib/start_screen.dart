// Flutter materyal tasarım kütüphanesini içeri aktarır.
import 'package:flutter/material.dart';
// 'question_screen.dart' dosyasını içeri aktarır. Bu dosya sıradaki soru ekranının tasarımını tanımlar.
import 'question_screen.dart';

// 'StartScreen' adında bir StatelessWidget sınıfı oluşturur.
class StartScreen extends StatelessWidget {
  // Constructor tanımlanır.
  const StartScreen({Key? key}) : super(key: key);

  // Ekranın görünümünü oluşturmak için 'build' metodu kullanılır.
  @override
  Widget build(BuildContext context) {
    // Bir Scaffold widget'ı kullanarak temel sayfa yapısını oluşturur.
    return Scaffold(
      // Sayfanın arka plan rengini belirler.
      backgroundColor: Colors.deepPurpleAccent,
      // Sayfanın içeriği 'Center' widget'ı ile merkezlenir.
      body: Center(
        child: Column(
          // Sütunun ana eksenini ortalar.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Bir resim ekler.
            Image.asset("assets/image.png", width: 325),
            // Başlık metni ekler.
            const Text(
              "Quiz App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8), // Boşluk ekler.
            // Başlat düğmesini ekler.
            ElevatedButton.icon(
              onPressed: () {
                // Navigator kullanarak başka bir ekranı başlatır.
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => QuestionScreen()),
                );
              },
              icon: const Icon(Icons.arrow_right_alt), // Düğme ikonu.
              label: const Text(
                "Start",
                style: TextStyle(fontSize: 22),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // Yazı rengi.
                padding: const EdgeInsets.fromLTRB(25, 12.5, 25, 12.5), // Kenar boşluğu.
              ),
            )
          ],
        ),
      ),
    );
  }
}
