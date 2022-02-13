import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_quiz_app/models/models.dart';
import 'package:my_quiz_app/repositories/quiz_repository.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  final QuizRepository _quizRepository;
  HomepageCubit({required QuizRepository qr})
      : _quizRepository = qr,
        super(HomepageLoading()) {
    _loadQuizList(update: true);
  }

  _loadQuizList({String category = 'gen', bool update = false}) async {
    if (update) {
      await _quizRepository.checkForUpdate();
    }
    List<Quiz> quizzes = _quizRepository
        .loadQuizList()
        .where((quiz) => quiz.category == category)
        .toList();
    quizzes.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

    emit(HomepageLoaded(quizzes: quizzes, category: category));
  }

  changeCategory(String code) {
    emit(HomepageLoading());
    _loadQuizList(category: code);
  }
}
