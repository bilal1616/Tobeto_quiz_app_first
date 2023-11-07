import 'package:quiz_app_workshop/data/questions.dart';

// 'QuizQuestions' adında bir sınıf tanımlanır.
class QuizQuestions {
  // Soru verilerini almak için kullanılan metot.
  List<QuizQuestion> getQuestions() {
    return questions; // 'questions' değişkeni, 'questions.dart' dosyasından alınır ve bu soruların bir listesini döndürür.
  }
}
