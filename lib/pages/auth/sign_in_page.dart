import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart' hide AuthState;
import 'package:my_quiz_app/bloc/auth_bloc.dart';

class AppSignInPage extends StatelessWidget {
  const AppSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthReady && !state.appUser.isGuest) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SignInScreen(providerConfigs: [
          EmailProviderConfiguration(),
        ]),
      ),
    );
  }
}
