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

    return BlocBuilder<QuizPageBloc, QuizPageState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text(
                    'Question ${state.questionNumber + 1}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(question.text),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 15),
                  itemCount: question.choices.length,
                  itemBuilder: (context, index) {
                    Answer choice = question.choices[index];
                    return AnswerTile(index: index, choice: choice);
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
      },
    );
  }
}

class AnswerTile extends StatelessWidget {
  const AnswerTile({
    Key? key,
    required this.index,
    required this.choice,
  }) : super(key: key);

  final int index;
  final Answer choice;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizPageBloc, QuizPageState>(
      builder: (context, state) {
        Widget icon = Icon(
          Icons.help,
          color: Colors.black45,
        );
        bool selected = false;

        if (index == state.answerIdx) {
          selected = true;
          if (state.answerStatus.isCorrect) {
            icon = Icon(
              Icons.check_circle,
              color: Colors.green,
            );
          } else {
            icon = Transform.rotate(
              angle: 0.785,
              child: Icon(Icons.add_circle, color: Colors.red),
            );
          }
        }

        return GestureDetector(
          onTap: () {
            if (state.answerStatus.isCorrect) return;

            context.read<QuizPageBloc>().add(
                  AnswerQuestion(
                    isCorrect: choice.correct,
                    answerIdx: index,
                  ),
                );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                icon,
                SizedBox(width: 15),
                AnimatedSize(
                  alignment: Alignment.topLeft,
                  duration: Duration(milliseconds: 250),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(choice.text),
                      selected
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(choice.feedback.isNotEmpty
                                  ? choice.feedback
                                  : choice.correct
                                      ? 'That is correct'
                                      : 'That is not correct'),
                            )
                          : SizedBox()
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
