import 'package:flutter/material.dart';
import 'package:my_quiz_app/models/models.dart';

class QuizIntro extends StatelessWidget {
  const QuizIntro({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(quiz.description),
        ElevatedButton(onPressed: () {}, child: Text('start'))
      ],
    );
  }
}
