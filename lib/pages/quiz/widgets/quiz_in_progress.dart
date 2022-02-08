import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quiz_app/models/models.dart';
import 'package:my_quiz_app/pages/quiz/bloc/quizpage_bloc.dart';

class QuizInProgress extends StatelessWidget {
  const QuizInProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuizPageBloc quizPageBloc = context.watch<QuizPageBloc>();
    Quiz quiz = quizPageBloc.quiz;

    Question question = quiz.questions[quizPageBloc.state.questionNumber];

    return Column(
      children: [
        Text(question.text),
        Expanded(
          child: ListView.builder(
              itemCount: question.choices.length,
              itemBuilder: (context, index) {
                Answer choice = question.choices[index];

                return ListTile(
                  selectedColor: Colors.white,
                  selectedTileColor: quizPageBloc.state.answerStatus.isCorrect
                      ? Colors.green
                      : Colors.red,
                  selected: index == quizPageBloc.state.answerIdx,
                  onTap: () {
                    quizPageBloc.add(
                      AnswerQuestion(
                        isCorrect: choice.correct,
                        answerIdx: index,
                      ),
                    );
                  },
                  title: Text(choice.text),
                );
              }),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<QuizPageBloc, QuizPageState>(
              builder: (context, state) {
                if (state.answerStatus.isUnanswered) {
                  return SizedBox();
                } else {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: state.answerStatus.isCorrect
                            ? Colors.green
                            : Colors.red,
                      ),
                      onPressed: () {
                        quizPageBloc.add(NextQuestion());
                      },
                      child: Text('Next'));
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
