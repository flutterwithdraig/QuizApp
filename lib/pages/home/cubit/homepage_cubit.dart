import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_quiz_app/models/models.dart';
import 'package:my_quiz_app/repositories/quiz_repository.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<List<Quiz>> {
  final QuizRepository _quizRepository;
  HomepageCubit({required QuizRepository qr})
      : _quizRepository = qr,
        super([]) {
    _loadQuizList();
  }

  _loadQuizList() async {
    await _quizRepository.checkForUpdate();
    emit(_quizRepository.loadQuizList());
  }
}
