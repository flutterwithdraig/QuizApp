import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quiz_app/pages/quiz/bloc/quizpage_bloc.dart';

class QuizFinished extends StatelessWidget {
  const QuizFinished({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int score = context.read<QuizPageBloc>().state.score;

    return Column(
      children: [
        Text('Well done you have finished the quiz'),
        Text('You scored: $score'),
      ],
    );
  }
}
