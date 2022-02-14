import 'package:flutter/material.dart';
import 'package:my_quiz_app/models/models.dart';

class QuizInfo extends StatelessWidget {
  const QuizInfo({Key? key, required this.quiz}) : super(key: key);

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: TextStyle(fontSize: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.timer,
                size: 12,
              ),
              SizedBox(width: 5),
              Text('${quiz.time} mins'),
            ],
          ),
          SizedBox(width: 5),
          Row(
            children: [
              Icon(
                Icons.help,
                size: 12,
              ),
              SizedBox(width: 5),
              Text('${quiz.questions.length} questions'),
            ],
          )
        ],
      ),
    );
  }
}
