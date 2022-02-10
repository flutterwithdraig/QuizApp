import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quiz_app/models/models.dart';
import 'package:my_quiz_app/pages/pages.dart';
import 'package:my_quiz_app/repositories/quiz_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Quiz> quizzes = context.read<QuizRepository>().loadQuizList();

    return Scaffold(
      appBar: AppBar(
        title: Text('My Quiz App'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DevPage()));
              },
              child: Text('Dev'))
        ],
      ),
      body: ListView.builder(
        itemCount: quizzes.length,
        itemBuilder: ((context, index) => ListTile(
              title: Text(quizzes[index].name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(
                      quizId: quizzes[index].id,
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}

class DevPage extends StatelessWidget {
  const DevPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dev')),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                context.read<QuizRepository>().storeData();
              },
              child: Text('Load data into Hive'))
        ],
      ),
    );
  }
}
