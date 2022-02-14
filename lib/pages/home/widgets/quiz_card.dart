import 'package:flutter/material.dart';
import 'package:my_quiz_app/models/models.dart';
import 'package:my_quiz_app/pages/pages.dart';
import 'package:my_quiz_app/widgets/widgets.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({Key? key, required this.quiz}) : super(key: key);

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizPage(
              quizId: quiz.id,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black12,
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(5, 5),
                color: Colors.black26,
                blurRadius: 5,
              )
            ]),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10),
              ),
              child: Hero(
                tag: quiz.id,
                child: QuizImage(url: quiz.imageUrl),
              ),
            ),
            SizedBox(width: 10),
            Expanded(child: Text(quiz.name, maxLines: 2)),
            SizedBox(width: 5),
            QuizInfo(quiz: quiz),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
