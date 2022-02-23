part of 'highscore_cubit.dart';

abstract class HighscoreState extends Equatable {
  const HighscoreState();

  @override
  List<Object> get props => [];
}

class HighscoreLoading extends HighscoreState {}

class HighScoresLoaded extends HighscoreState {
  final List<Result> results;
  const HighScoresLoaded({
    required this.results,
  });
  @override
  List<Object> get props => [results];
}
