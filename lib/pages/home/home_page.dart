import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quiz_app/models/models.dart';
import 'package:my_quiz_app/pages/pages.dart';
import 'package:my_quiz_app/repositories/quiz_repository.dart';

import 'cubit/homepage_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<Quiz> quizzes = context.read<QuizRepository>().loadQuizList();

    return BlocProvider(
      create: (context) => HomepageCubit(qr: context.read<QuizRepository>()),
      child: Scaffold(
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
        body: BlocBuilder<HomepageCubit, List<Quiz>>(
          builder: (context, state) {
            if (state.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: ((context, index) => ListTile(
                    title: Text(state[index].name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage(
                            quizId: state[index].id,
                          ),
                        ),
                      );
                    },
                  )),
            );
          },
        ),
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
