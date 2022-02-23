import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_quiz_app/models/result_model.dart';
import 'package:my_quiz_app/repositories/result_repository.dart';

part 'highscore_state.dart';

class HighscoreCubit extends Cubit<HighscoreState> {
  HighscoreCubit({
    required this.quizId,
    required ResultRepository resultRepository,
  })  : _resultRepository = resultRepository,
        super(HighscoreLoading()) {
    _loadHighScores();
  }

  final String quizId;
  final ResultRepository _resultRepository;

  _loadHighScores() async {
    List<Result> results = await _resultRepository.getHighScoresForQuiz(quizId);
    emit(HighScoresLoaded(results: results));
  }
}
