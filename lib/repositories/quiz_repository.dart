import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_quiz_app/models/models.dart';
import 'package:my_quiz_app/repositories/settings_repository.dart';

class QuizRepository {
  final Box _box;
  final SettingsResposity _settingsResposity;

  QuizRepository._({required Box box, required SettingsResposity sr})
      : _box = box,
        _settingsResposity = sr;

  static Future<QuizRepository> create({required SettingsResposity sr}) async {
    Hive.registerAdapter(QuizAdapter());
    Hive.registerAdapter(QuestionAdapter());
    Hive.registerAdapter(AnswerAdapter());

    Box box = await Hive.openBox('quiz');

    return QuizRepository._(box: box, sr: sr);
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

  Future<void> checkForUpdate() async {
    DateTime lastUpdated = _settingsResposity.lastUpdated;
    if (DateTime.now().difference(lastUpdated) > Duration(minutes: 1)) {
      print("Do our update");
      try {
        var resp = await http
            .get(Uri.parse('http://10.0.2.2:5500/server/quiz.json'))
            .timeout(Duration(seconds: 10), onTimeout: () => throw Error());

        var data = jsonDecode(resp.body);
        for (var q in data) {
          Quiz quiz = Quiz.fromMap(q);
          _box.put(quiz.id, quiz);
        }
        _settingsResposity.lastUpdated = DateTime.now();
      } catch (e) {
        print("We have an error");
        return;
      }
    }
  }
}
