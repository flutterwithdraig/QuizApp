import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quiz_app/models/models.dart';
import 'package:my_quiz_app/pages/quiz/bloc/quizpage_bloc.dart';
import 'package:my_quiz_app/repositories/quiz_repository.dart';

class QuizIntro extends StatelessWidget {
  const QuizIntro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Quiz quiz = context
        .read<QuizRepository>()
        .getQuizById(context.read<QuizPageBloc>().state.quizId);

    return Column(
      children: [
        Text(quiz.description),
        ElevatedButton(
            onPressed: () {
              context.read<QuizPageBloc>().add(StartQuiz());
            },
            child: Text('start'))
      ],
    );
  }
}
