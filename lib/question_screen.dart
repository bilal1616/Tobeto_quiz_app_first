import 'package:flutter/material.dart';
import 'package:quiz_app_workshop/data/questions.dart';
import 'package:quiz_app_workshop/models/quiz_questions.dart';
import 'package:quiz_app_workshop/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key); // Widget'in key özelliği

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
  // bu kod parçası, widget'in state nesnesini oluşturur bir sınıfın içinde kullanılan bir metodu yeniden (override) tanımlar.
  // ve widget ile bu state nesnesi arasında bir bağlantı kurar.
}

class _QuestionScreenState extends State<QuestionScreen> {
  final quizQuestions = QuizQuestions(); // QuizQuestions sınıfından bir nesne oluşturulur.
  List<QuizQuestion> questions = []; //"questions" adında bir boş bir Liste oluşturur ve bu Liste,"QuizQuestion" türünden nesneleri depolamak için kullanılır.
  int currentQuestionIndex = 0; // Mevcut sorunun indeksi
  int correctAnswers = 0; // Doğru cevap sayısı

  @override
  void initState() {
    super.initState();
    // Soruları almak için 'quizQuestions' nesnesini kullanır.
    questions = quizQuestions.getQuestions();
  }

  List<String> selectedAnswers =
      []; // Kullanıcının seçtiği cevapları saklamak için bir liste oluşturulur.

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
      // Bu kod satırı,"questions" listesindeki her sorunun metnini alarak yeni bir metin (String) listesi olan "questionTexts" oluşturur.
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
      ); // "ResultScreen" bileşeni,"questions" (soru metinleri),"selectedAnswers" (seçilen cevaplar) ve "correctAnswers" (doğru cevaplar)
    } // gibi verileri alarak sonuç ekranını hazırlar ve kullanıcıyı bu ekrana yönlendirir.

    
    // Seçilen cevapları saklamak için listeye ekler.
    selectedAnswers.add(selectedAnswer);
  }

  @override
  Widget build(BuildContext context) {
    // Şu anki soruyu alır.
    final question = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent, // Ekranın arka plan rengi
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0), // Soru metni etrafına biraz boşluk ekler.
              child: Text("Soru ${currentQuestionIndex + 1}: ${question.question}",
                style: TextStyle(fontSize: 19, color: Colors.white), // Soru metni stil
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: question.answers.asMap().entries.map((entry) {
                // `asMap()` fonksiyonu, listenin her bir öğesine bir indeks atar ve bu indekslerle birlikte öğeleri çiftler halinde döndürür.
                // `question.answers` listesindeki her öğe için bir işlem yapar ve bu öğeleri bir harita (map) yapısında saklar.
                // bu harita yapısındaki her çifti `map()` fonksiyonu ile işleyerek yeni bir liste oluşturur.
                // `entry` değişkeni, her bir liste öğesini ve onun indeksini temsil eder.
                final index = entry.key; //`entry.key`, `asMap()` kullanılarak indeksin elde edildiği çift yapının bir parçasıdır.
                final answer = entry.value; // `entry.value`, `asMap()` kullanılarak öğenin değerini temsil eder.
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
                        child: Text("$option) $answer", // Seçenek metni
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white, fontSize: 18), // Cevap butonu stil
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Aralık ekledik
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
