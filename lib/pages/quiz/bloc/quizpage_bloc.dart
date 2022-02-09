import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quizpage_event.dart';
part 'quizpage_state.dart';

class QuizPageBloc extends Bloc<QuizPageEvent, QuizPageState> {
  QuizPageBloc() : super(QuizPageState()) {
    on<LoadPage>(_onLoadPage);
    on<StartQuiz>(_onStartQuiz);
  }

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
    ));
  }
}
