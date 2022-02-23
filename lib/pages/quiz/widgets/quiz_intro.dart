import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quiz_app/bloc/auth_bloc.dart';
import 'package:my_quiz_app/helpers.dart';
import 'package:my_quiz_app/models/models.dart';
import 'package:my_quiz_app/pages/quiz/bloc/quizpage_bloc.dart';
import 'package:my_quiz_app/pages/quiz/widgets/cubit/highscore_cubit.dart';
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
        AuthPrompt(),
        SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              context.read<QuizPageBloc>().add(StartQuiz());
            },
            child: Text('start')),
        HighScore(quizId: quiz.id),
      ],
    );
  }
}

class HighScore extends StatelessWidget {
  const HighScore({Key? key, required this.quizId}) : super(key: key);
  final String quizId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthReady && !state.appUser.isGuest) {
          return BlocProvider(
            create: (context) => HighscoreCubit(
              quizId: quizId,
              resultRepository: context.read(),
            ),
            child: BlocBuilder<HighscoreCubit, HighscoreState>(
              builder: (context, state) {
                if (state is HighscoreLoading) {
                  return CircularProgressIndicator();
                } else if (state is HighScoresLoaded) {
                  return Column(
                    children: [
                      SizedBox(height: 20),
                      Text('Current High Scores'),
                      if (state.results.isEmpty) ...[
                        SizedBox(height: 10),
                        Text('No high scores yet. Be the first!'),
                      ] else ...[
                        DataTable(
                          columns: [
                            DataColumn(label: Text('name')),
                            DataColumn(label: Text('time')),
                            DataColumn(label: Text('score')),
                          ],
                          rows: state.results
                              .map((r) => DataRow(cells: [
                                    DataCell(Text(r.nickName)),
                                    DataCell(
                                      Text(
                                        convertDurationAsTimeString(
                                            Duration(seconds: r.time)),
                                      ),
                                    ),
                                    DataCell(Text(r.score.toString())),
                                  ]))
                              .toList(),
                        ),
                      ]
                    ],
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
