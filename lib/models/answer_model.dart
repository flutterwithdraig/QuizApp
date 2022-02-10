import 'dart:convert';

import 'package:hive_flutter/adapters.dart';

part 'answer_model.g.dart';

@HiveType(typeId: 3)
class Answer {
  @HiveField(0)
  final String text;
  @HiveField(1)
  final bool correct;
  @HiveField(2)
  final String feedback;
  Answer({
    required this.text,
    required this.correct,
    this.feedback = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'correct': correct,
      'feedback': feedback,
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      text: map['text'] ?? '',
      correct: map['correct'] ?? false,
      feedback: map['feedback'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Answer.fromJson(String source) => Answer.fromMap(json.decode(source));
}
