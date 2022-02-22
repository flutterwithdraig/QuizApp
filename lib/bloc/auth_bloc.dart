import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_quiz_app/models/models.dart';
import 'package:username_gen/username_gen.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  StreamSubscription<AppUser>? _authStateChanges;

  AuthBloc() : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<AppUserChanged>(_onUserChanged);
  }

  FutureOr<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) {
    _authStateChanges =
        FirebaseAuth.instance.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) return AppUser.empty();

      String? displayName = firebaseUser.displayName;
      if (displayName == null || displayName.isEmpty) {
        displayName = UsernameGen().generate();
        firebaseUser.updateDisplayName(displayName);
      }

      final user = AppUser(
        displayName: displayName,
        uid: firebaseUser.uid,
        isGuest: false,
      );
      return user;
    }).listen((user) {
      add(AppUserChanged(appUser: user));
    });
  }

  FutureOr<void> _onUserChanged(AppUserChanged event, Emitter<AuthState> emit) {
    emit(AuthReady(appUser: event.appUser));
  }

  @override
  Future<void> close() {
    _authStateChanges?.cancel();
    return super.close();
  }
}
