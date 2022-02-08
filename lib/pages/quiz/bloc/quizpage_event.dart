part of 'quizpage_bloc.dart';

abstract class QuizPageEvent extends Equatable {
  const QuizPageEvent();

  @override
  List<Object> get props => [];
}

class LoadPage extends QuizPageEvent {
  final String quizId;
  const LoadPage({
    required this.quizId,
  });
  @override
  List<Object> get props => [quizId];
}

class StartQuiz extends QuizPageEvent {}

class AnswerQuestion extends QuizPageEvent {
  final bool isCorrect;
  final int answerIdx;
  const AnswerQuestion({
    required this.isCorrect,
    required this.answerIdx,
  });

  @override
  List<Object> get props => [isCorrect, answerIdx];
}

class NextQuestion extends QuizPageEvent {}
