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

  List<Quiz> loadQuizList() {
    return _box.values.cast<Quiz>().toList();
  }

  Quiz getQuiz(String key) {
    return _box.get(key, defaultValue: Quiz.empty());
  }

  Future<void> storeData(String data) async {
    var json = jsonDecode(data);
    for (var data in json) {
      Quiz quiz = Quiz.fromMap(data);
      _box.put(quiz.id, quiz);
    }
  }

  Future<void> checkForUpdate({bool force = false}) async {
    DateTime lastUpdated = _settingsResposity.lastUpdated;
    if (force || DateTime.now().difference(lastUpdated) > Duration(days: 7)) {
      print("Do our update");
      try {
        var resp = await http
            .get(Uri.parse('https://HOSTING_URL/quiz.json'))
            .timeout(Duration(seconds: 10), onTimeout: () => throw Error());

        storeData(resp.body);

        _settingsResposity.lastUpdated = DateTime.now();
      } catch (e) {
        if (_box.isEmpty) {
          String data =
              await jsonDecode(await rootBundle.loadString('assets/quiz.json'));
          storeData(data);
        }
        return;
      }
    }
  }

  void emptyHive() {
    _box.clear();
  }
}
