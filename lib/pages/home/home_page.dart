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
        body: BlocBuilder<HomepageCubit, HomepageState>(
          builder: (context, state) {
            if (state is HomepageLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HomepageLoaded) {
              return Column(
                children: [
                  Categories(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.quizzes.length,
                      itemBuilder: ((context, index) => ListTile(
                            title: Text(state.quizzes[index].name),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QuizPage(
                                    quizId: state.quizzes[index].id,
                                  ),
                                ),
                              );
                            },
                          )),
                    ),
                  ),
                ],
              );
            } else {
              return Text('Something went wrong');
            }
          },
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CategoryButton(
          text: 'General Knowledge',
          code: 'gen',
        ),
        CategoryButton(
          text: 'Music',
          code: 'music',
        ),
      ],
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.text,
    required this.code,
  }) : super(key: key);
  final String text;
  final String code;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<HomepageCubit>().changeCategory(code);
      },
      child: Text(text),
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
                context.read<QuizRepository>().emptyHive();
              },
              child: Text('Empty Hive'))
        ],
      ),
    );
  }
}
