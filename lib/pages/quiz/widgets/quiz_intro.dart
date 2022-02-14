import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quiz_app/models/models.dart';
import 'package:my_quiz_app/pages/quiz/bloc/quizpage_bloc.dart';
import 'package:my_quiz_app/widgets/widgets.dart';

class QuizIntro extends StatelessWidget {
  const QuizIntro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Quiz quiz = context.read<QuizPageBloc>().quiz;

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: SizedBox()),
            QuizInfo(quiz: quiz),
          ],
        ),
        SizedBox(height: 20),
        Text(quiz.description),
        SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              context.read<QuizPageBloc>().add(StartQuiz());
            },
            child: Text('start'))
      ],
    );
  }
}
