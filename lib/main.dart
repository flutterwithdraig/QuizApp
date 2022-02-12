import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_quiz_app/pages/pages.dart';
import 'package:my_quiz_app/repositories/quiz_repository.dart';

void main() async {
  await Hive.initFlutter();

  QuizRepository qr = await QuizRepository.create();

  runApp(MyApp(qr: qr));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.qr}) : super(key: key);

  final QuizRepository qr;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => qr,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
