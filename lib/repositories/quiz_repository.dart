import 'package:my_quiz_app/models/models.dart';

class QuizRepository {
  List<Quiz> getAllQuizzes() {
    return quizData;
  }

  // Get an individual quiz
  Quiz getQuizById(String id) {
    return quizData.firstWhere((quiz) => quiz.id == id,
        orElse: () => Quiz.empty());
  }
}
