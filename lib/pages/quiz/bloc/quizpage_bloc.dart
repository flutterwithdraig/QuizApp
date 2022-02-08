import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_quiz_app/models/models.dart';
import 'package:my_quiz_app/repositories/quiz_repository.dart';

part 'quizpage_event.dart';
part 'quizpage_state.dart';

class QuizPageBloc extends Bloc<QuizPageEvent, QuizPageState> {
  QuizPageBloc({required QuizRepository quizRepository})
      : _quizRepository = quizRepository,
        super(QuizPageState()) {
    on<LoadPage>(_onLoadPage);
    on<StartQuiz>(_onStartQuiz);
    on<AnswerQuestion>(_onAnswerQuestion);
    on<NextQuestion>(_onNextQuestion);
  }

  final QuizRepository _quizRepository;
  Quiz get quiz => _quizRepository.getQuizById(state.quizId);

  FutureOr<void> _onLoadPage(LoadPage event, Emitter<QuizPageState> emit) {
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
    ));
  }

  FutureOr<void> _onAnswerQuestion(
      AnswerQuestion event, Emitter<QuizPageState> emit) {
    emit(state.copyWith(
      answerStatus: event.isCorrect ? AnswerStatus.correct : AnswerStatus.wrong,
      answerIdx: event.answerIdx,
    ));
  }

  FutureOr<void> _onNextQuestion(
      NextQuestion event, Emitter<QuizPageState> emit) {
    int nextQuestion = state.questionNumber + 1;

    if (nextQuestion < quiz.questions.length) {
      emit(state.copyWith(
        questionNumber: nextQuestion,
        answerIdx: -99,
        answerStatus: AnswerStatus.unanswered,
      ));
    } else {
      emit(state.copyWith(status: QuizStatus.finished));
    }
  }
}
