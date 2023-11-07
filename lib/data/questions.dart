// QuizQuestion sınıfı tanımlanır. Bu sınıf, bir soruyu, cevapları ve doğru cevabı temsil eder.
class QuizQuestion {
  final String question; // Soru metni
  final List<String> answers; // Cevapların listesi
  final String correctAnswer; // Doğru cevap

  // QuizQuestion sınıfının constructor'ı, soru, cevaplar ve doğru cevap alır.
  const QuizQuestion(this.question, this.answers, this.correctAnswer);
}

// Dizi içinde çeşitli sorular ve bunların cevapları oluşturulur.
const List<QuizQuestion> questions = [
  QuizQuestion(
    "Aşağıdakilerden hangisi flutter'da state'i update eder?",
    ["constructor", "class", "setState", "statelesswidget"],
    "setState",
  ),
  QuizQuestion(
    "Flutter nedir?",
    [
      "Bir programlama dili.",
      "Mobil geliştirme framework'üdür.",
      "Bir oyun motoru.",
      "Bir veritabanı yönetim sistemi.",
    ],
    "Mobil geliştirme framework'üdür.",
  ),
  QuizQuestion(
    "Dart programlama dili hangi şirket tarafından geliştirilmiştir?",
    ["Facebook", "Apple", "Microsoft", "Google"],
    "Google",
  ),
  QuizQuestion(
    "Flutter'ın temel yapı taşı nedir?",
    ["Class", "Object", "Widget", "Function"],
    "Widget",
  ),
  QuizQuestion(
    "Flutter hangi programlama dilinde yazılmıştır?",
    ["Java", "Dart", "C++", "Python"],
    "Dart",
  ),
  QuizQuestion(
    "Flutter'da state yönetimi için kullanılan sınıf nedir?",
    ["StatefulWidget", "StatelessWidget", "StateManager", "AppState"],
    "StatefulWidget",
  ),
  QuizQuestion(
    "Flutter ile hangi platformlar için uygulama geliştirilebilir?",
    ["Sadece iOS", "Sadece Android", "iOS ve Android", "Windows"],
    "iOS ve Android",
  ),
  QuizQuestion(
    "Flutter'ın popüler widget'ı nedir?",
    ["Scaffold", "Container", "AppBar", "ListView"],
    "Scaffold",
  ),
];

