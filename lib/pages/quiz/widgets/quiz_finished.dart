import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quiz_app/helpers.dart';
import 'package:my_quiz_app/pages/quiz/bloc/quizpage_bloc.dart';

class QuizFinished extends StatelessWidget {
  const QuizFinished({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int score = context.read<QuizPageBloc>().state.score;
    String timeTaken = convertDurationAsTimeString(DateTime.now().difference(
      DateTime.parse(
        context.read<QuizPageBloc>().state.startTime,
      ),
    ));

    return Column(
      children: [
        Text(
          'Well done you have finished the quiz!',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text('You scored: $score'),
        SizedBox(height: 20),
        Text('You took: $timeTaken'),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('End Quiz'),
        ),
      ],
    );
  }
}
