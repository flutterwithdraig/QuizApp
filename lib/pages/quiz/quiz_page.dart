import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quiz_app/models/quiz_model.dart';
import 'package:my_quiz_app/pages/quiz/widgets/quiz_finished.dart';
import 'package:my_quiz_app/pages/quiz/widgets/quiz_in_progress.dart';
import 'package:my_quiz_app/pages/quiz/widgets/quiz_intro.dart';
import 'package:my_quiz_app/repositories/quiz_repository.dart';

import 'bloc/quizpage_bloc.dart';

class QuizPage extends StatelessWidget {
  final String quizId;
  const QuizPage({Key? key, required this.quizId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizPageBloc()..add(LoadPage(quizId: quizId)),
      child: Scaffold(
          appBar: AppBar(title: Text('Quiz Name')),
          body: BlocBuilder<QuizPageBloc, QuizPageState>(
            builder: (context, state) {
              if (state.status.isReady) {
                return QuizIntro();
              } else if (state.status.isStarted) {
                return QuizInProgress();
              } else if (state.status.isFinished) {
                return QuizFinished();
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
