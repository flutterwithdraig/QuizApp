part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthReady extends AuthState {
  final AppUser appUser;
  const AuthReady({
    required this.appUser,
  });

  @override
  List<Object> get props => [appUser];
}
