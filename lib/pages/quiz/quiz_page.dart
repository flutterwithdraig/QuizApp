import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quiz_app/models/quiz_model.dart';
import 'package:my_quiz_app/pages/quiz/widgets/quiz_finished.dart';
import 'package:my_quiz_app/pages/quiz/widgets/quiz_in_progress.dart';
import 'package:my_quiz_app/pages/quiz/widgets/quiz_intro.dart';
import 'package:my_quiz_app/repositories/quiz_repository.dart';
import 'package:my_quiz_app/widgets/quiz_image.dart';

import 'bloc/quizpage_bloc.dart';

class QuizPage extends StatelessWidget {
  final String quizId;
  const QuizPage({Key? key, required this.quizId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Quiz quiz = context.read<QuizRepository>().getQuiz(quizId);

    return BlocProvider(
      create: (context) => QuizPageBloc(
        quiz: quiz,
      )..add(LoadPage(quizId: quizId)),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: QuizPageAppBar(),
          body: Stack(
            children: [
              Hero(
                tag: quiz.id,
                child: QuizImage(
                  url: quiz.imageUrl,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * .8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(.8),
                    ),
                    child: BlocBuilder<QuizPageBloc, QuizPageState>(
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
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class QuizPageAppBar extends StatelessWidget with PreferredSizeWidget {
  const QuizPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black26,
      elevation: 0,
      title: Text(context.watch<QuizPageBloc>().quiz.name),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(42);
}
