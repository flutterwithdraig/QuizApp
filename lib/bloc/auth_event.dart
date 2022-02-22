part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {}

class AppUserChanged extends AuthEvent {
  final AppUser appUser;
  const AppUserChanged({
    required this.appUser,
  });
  @override
  List<Object> get props => [appUser];
}
