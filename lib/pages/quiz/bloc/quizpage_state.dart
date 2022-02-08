part of 'quizpage_bloc.dart';

enum QuizStatus {
  initial,
  ready,
  started,
  finished,
}

extension QuizStatusX on QuizStatus {
  bool get isInitial => this == QuizStatus.initial;
  bool get isReady => this == QuizStatus.ready;
  bool get isStarted => this == QuizStatus.started;
  bool get isFinished => this == QuizStatus.finished;
}

class QuizPageState extends Equatable {
  final QuizStatus status;
  final String quizId;
  final int questionNumber;

  const QuizPageState({
    this.status = QuizStatus.initial,
    this.quizId = '',
    this.questionNumber = 0,
  });

  @override
  List<Object> get props => [status, quizId, questionNumber];

  QuizPageState copyWith({
    QuizStatus? status,
    String? quizId,
    int? questionNumber,
  }) {
    return QuizPageState(
      status: status ?? this.status,
      quizId: quizId ?? this.quizId,
      questionNumber: questionNumber ?? this.questionNumber,
    );
  }
}
