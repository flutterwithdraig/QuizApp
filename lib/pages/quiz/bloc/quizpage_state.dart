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

enum AnswerStatus {
  unanswered,
  correct,
  wrong,
}

extension AnswerStatusX on AnswerStatus {
  bool get isUnanswered => this == AnswerStatus.unanswered;
  bool get isCorrect => this == AnswerStatus.correct;
  bool get isWrong => this == AnswerStatus.wrong;
}

class QuizPageState extends Equatable {
  final QuizStatus status;
  final String quizId;
  final int questionNumber;
  final AnswerStatus answerStatus;
  final int answerIdx;

  const QuizPageState({
    this.answerStatus = AnswerStatus.unanswered,
    this.answerIdx = -99,
    this.status = QuizStatus.initial,
    this.quizId = '',
    this.questionNumber = 0,
  });

  @override
  List<Object> get props => [
        status,
        quizId,
        questionNumber,
        answerIdx,
        answerStatus,
      ];

  QuizPageState copyWith({
    QuizStatus? status,
    String? quizId,
    int? questionNumber,
    AnswerStatus? answerStatus,
    int? answerIdx,
  }) {
    return QuizPageState(
      status: status ?? this.status,
      quizId: quizId ?? this.quizId,
      questionNumber: questionNumber ?? this.questionNumber,
      answerStatus: answerStatus ?? this.answerStatus,
      answerIdx: answerIdx ?? this.answerIdx,
    );
  }
}
