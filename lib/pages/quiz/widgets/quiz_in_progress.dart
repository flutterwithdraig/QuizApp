import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quiz_app/models/models.dart';
import 'package:my_quiz_app/pages/quiz/bloc/quizpage_bloc.dart';
import 'package:my_quiz_app/repositories/quiz_repository.dart';

class QuizInProgress extends StatelessWidget {
  const QuizInProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Quiz quiz = context
        .read<QuizRepository>()
        .getQuizById(context.read<QuizPageBloc>().state.quizId);

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
