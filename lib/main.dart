import 'package:flutter/material.dart';
import 'package:my_quiz_app/models/quiz_model.dart';
import 'package:my_quiz_app/pages/quiz/quiz_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('My Quiz App')),
        body: ListView.builder(
          itemCount: quizData.length,
          itemBuilder: ((context, index) => ListTile(
                title: Text(quizData[index].name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizPage(),
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
