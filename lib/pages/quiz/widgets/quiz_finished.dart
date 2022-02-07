import 'package:flutter/material.dart';
import 'package:my_quiz_app/models/models.dart';

class QuizFinished extends StatelessWidget {
  const QuizFinished({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Well done you have finished the quiz'),
      ],
    );
  }
}
