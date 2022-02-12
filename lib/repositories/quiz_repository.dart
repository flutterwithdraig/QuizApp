import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_quiz_app/models/models.dart';

class QuizRepository {
  final Box _box;

  QuizRepository._({required Box box}) : _box = box;

  static Future<QuizRepository> create() async {
    Hive.registerAdapter(QuizAdapter());
    Hive.registerAdapter(QuestionAdapter());
    Hive.registerAdapter(AnswerAdapter());

    Box box = await Hive.openBox('quiz');
    return QuizRepository._(box: box);
  }

  // List<Quiz> getAllQuizzes() {
  //   return quizData;
  // }

  // // Get an individual quiz
  // Quiz getQuizById(String id) {
  //   return quizData.firstWhere((quiz) => quiz.id == id,
  //       orElse: () => Quiz.empty());
  // }

  List<Quiz> loadQuizList() {
    return _box.values.cast<Quiz>().toList();
  }

  Quiz getQuiz(String key) {
    return _box.get(key, defaultValue: Quiz.empty());
  }

  Future<void> storeData() async {
    var json = jsonDecode(await rootBundle.loadString('assets/quiz.json'));
    for (var data in json) {
      Quiz quiz = Quiz.fromMap(data);
      print(quiz.name);
      _box.put(quiz.id, quiz);
    }
  }
}
