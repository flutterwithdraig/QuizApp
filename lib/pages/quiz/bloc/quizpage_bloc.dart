import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_quiz_app/bloc/auth_bloc.dart';
import 'package:my_quiz_app/models/models.dart';
import 'package:my_quiz_app/models/result_model.dart';
import 'package:my_quiz_app/repositories/result_repository.dart';

part 'quizpage_event.dart';
part 'quizpage_state.dart';

class QuizPageBloc extends Bloc<QuizPageEvent, QuizPageState> {
  QuizPageBloc({
    required Quiz quiz,
    required AuthBloc authBloc,
    required ResultRepository resultRepository,
  })  : _quiz = quiz,
        _authBloc = authBloc,
        _resultRepository = resultRepository,
        super(QuizPageState()) {
    on<LoadPage>(_onLoadPage);
    on<StartQuiz>(_onStartQuiz);
    on<AnswerQuestion>(_onAnswerQuestion);
    on<NextQuestion>(_onNextQuestion);
  }

  final Quiz _quiz;
  Quiz get quiz => _quiz;

  final AuthBloc _authBloc;
  final ResultRepository _resultRepository;

  FutureOr<void> _onLoadPage(LoadPage event, Emitter<QuizPageState> emit) {
    if (_quiz.random) {
      _quiz.questions.shuffle();
    }
    emit(
      state.copyWith(
        status: QuizStatus.ready,
        quizId: event.quizId,
      ),
    );
  }

  FutureOr<void> _onStartQuiz(StartQuiz event, Emitter<QuizPageState> emit) {
    emit(state.copyWith(
      status: QuizStatus.started,
      questionNumber: 0,
      answerIdx: -99,
      score: 0,
      startTime: DateTime.now().toIso8601String(),
    ));
  }

  FutureOr<void> _onAnswerQuestion(
      AnswerQuestion event, Emitter<QuizPageState> emit) {
    int score = state.score;

    if (state.answerStatus.isUnanswered) {
      score += event.isCorrect ? 10 : 0;
    }

    emit(state.copyWith(
      answerStatus: event.isCorrect ? AnswerStatus.correct : AnswerStatus.wrong,
      answerIdx: event.answerIdx,
      score: score,
    ));
  }

  Future<FutureOr<void>> _onNextQuestion(
      NextQuestion event, Emitter<QuizPageState> emit) async {
    int nextQuestion = state.questionNumber + 1;

    if (nextQuestion < quiz.questions.length) {
      emit(state.copyWith(
        questionNumber: nextQuestion,
        answerIdx: -99,
        answerStatus: AnswerStatus.unanswered,
      ));
    } else {
      AppUser user = (_authBloc.state as AuthReady).appUser;
      if (!user.isGuest) {
        final int timeTake = DateTime.now()
            .difference(DateTime.parse(state.startTime))
            .inSeconds;
        final result = Result(
          date: DateTime.now().toIso8601String(),
          nickName: user.displayName,
          score: state.score,
          time: timeTake,
        );

        await _resultRepository.saveResult(state.quizId, result);
      }
      emit(state.copyWith(status: QuizStatus.finished));
    }
  }
}
