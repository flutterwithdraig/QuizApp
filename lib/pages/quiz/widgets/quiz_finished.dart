import 'package:flutter/material.dart';

class QuizFinished extends StatelessWidget {
  const QuizFinished({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Well done you have finished the quiz'),
      ],
    );
  }
}
