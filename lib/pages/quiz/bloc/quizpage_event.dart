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

class AnswerQuestion extends QuizPageEvent {}

class NextQuestion extends QuizPageEvent {}
