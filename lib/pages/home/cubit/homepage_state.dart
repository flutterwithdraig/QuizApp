part of 'homepage_cubit.dart';

abstract class HomepageState extends Equatable {
  const HomepageState();

  @override
  List<Object> get props => [];
}

class HomepageLoading extends HomepageState {}

class HomepageLoaded extends HomepageState {
  final List<Quiz> quizzes;
  final String category;
  const HomepageLoaded({
    required this.quizzes,
    required this.category,
  });

  @override
  List<Object> get props => [quizzes, category];
}
