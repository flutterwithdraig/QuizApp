import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_quiz_app/bloc/auth_bloc.dart';
import 'package:my_quiz_app/pages/pages.dart';
import 'package:my_quiz_app/repositories/quiz_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_quiz_app/firebase_options.dart';
import 'package:my_quiz_app/repositories/settings_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();

  SettingsResposity sr = await SettingsResposity.create();
  QuizRepository qr = await QuizRepository.create(sr: sr);

  runApp(MyApp(qr: qr));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.qr}) : super(key: key);

  final QuizRepository qr;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => qr,
      child: BlocProvider(
        create: (context) => AuthBloc()..add(AppStarted()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
      ),
    );
  }
}
