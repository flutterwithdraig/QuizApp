import 'models.dart';

class Question {
  final String text;
  final List<Answer> choices;
  Question({
    required this.text,
    required this.choices,
  });
}
