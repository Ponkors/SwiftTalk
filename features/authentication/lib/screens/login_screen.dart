import 'package:authentication/authentication.dart';
import 'package:authentication/ui/reset_password_form.dart';
import 'package:authentication/ui/signIn_form.dart';
import 'package:authentication/ui/signUp_form.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: AppDimens.size_40),
            Center(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Column(
                      children: <Widget>[
                        BlocBuilder<AuthenticationBloc, AuthenticationState>(
                          builder: (_, AuthenticationState state) {
                            if (state.isResetPasswordPage) {
                              return const ResetPasswordForm();
                            }
                            if (state.isSignInPage) {
                              return const SignInForm();
                            }
                            return const SignUpForm();
                          },
                        ),
                      ],
                    ),
                  ),// AuthenticationSingInForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
