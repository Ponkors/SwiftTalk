import 'package:authentication/authentication.dart';
import 'package:authentication/ui/reset_password_form.dart';
import 'package:authentication/ui/sign_in_form.dart';
import 'package:authentication/ui/sign_up_form.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginAppBar'),
      ),
      body: const Center(
        child: LoginWithGoogleButton(),
      ),
    );
  }
}

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 5,
      color: Theme.of(context).primaryColor,
      onPressed: () {
        BlocProvider.of<AuthenticationBloc>(context)
            .add(AuthenticationWithGooglePressed());
      },
      child: Text('Login with Google Account'),
    );
  }
}




// class LogInScreen extends StatelessWidget {
//   const LogInScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             SizedBox(height: AppDimens.size_40),
//             Center(
//               child: Column(
//                 children: <Widget>[
//                   Center(
//                     child: Column(
//                       children: <Widget>[
//                         BlocBuilder<AuthenticationBloc, AuthenticationState>(
//                           builder: (_, AuthenticationState state) {
//                             if (state.isResetPasswordPage) {
//                               return const ResetPasswordForm();
//                             }
//                             if (state.isSignInPage) {
//                               return const SignInForm();
//                             }
//                             return const SignUpForm();
//                           },
//                         ),
//                       ],
//                     ),
//                   ),// AuthenticationSingInForm(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
