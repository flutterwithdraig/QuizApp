import 'package:flutter/material.dart';
import 'package:my_quiz_app/models/quiz_model.dart';
import 'package:my_quiz_app/pages/quiz/widgets/quiz_in_progress.dart';

import 'widgets/quiz_intro.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Quiz quiz = quizData[0];

    return Scaffold(
      appBar: AppBar(title: Text(quiz.name)),
      body: QuizInProgress(quiz: quiz),
    );
  }
}
