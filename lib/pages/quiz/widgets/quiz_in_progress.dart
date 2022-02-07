import 'package:flutter/material.dart';
import 'package:my_quiz_app/models/models.dart';

class QuizInProgress extends StatelessWidget {
  const QuizInProgress({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    Question question = quiz.questions[0];

    return Column(
      children: [
        Text(question.text),
        Expanded(
          child: ListView.builder(
              itemCount: question.choices.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(question.choices[index].text),
                );
              }),
        )
      ],
    );
  }
}
