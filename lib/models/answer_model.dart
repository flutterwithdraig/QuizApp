class Answer {
  final String text;
  final bool correct;
  final String feedback;
  Answer({
    required this.text,
    required this.correct,
    this.feedback = '',
  });
}
