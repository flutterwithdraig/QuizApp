part of 'homepage_cubit.dart';

abstract class HomepageState extends Equatable {
  const HomepageState();

  @override
  List<Object> get props => [];
}

class HomepageLoading extends HomepageState {}

class HomepageLoaded extends HomepageState {}
