import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quiz_app/bloc/auth_bloc.dart';
import 'package:my_quiz_app/pages/auth/sign_in_page.dart';

class AuthPrompt extends StatelessWidget {
  const AuthPrompt({Key? key, this.hideName = true}) : super(key: key);
  final bool hideName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthReady) {
          if (state.appUser.isGuest) {
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                Text('You are using this app as a Guest.'),
                Text('Your results will not be saved'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppSignInPage(),
                        ),
                      );
                    },
                    child: Text('Sign In'))
              ]),
            );
          } else {
            return hideName
                ? SizedBox()
                : Column(
                    children: [
                      SizedBox(height: 10),
                      Text('Welcome back'),
                      Text(state.appUser.displayName),
                    ],
                  );
          }
        }
        return Container();
      },
    );
  }
}
