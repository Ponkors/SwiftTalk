// import 'package:authentication/ui/app_text_field.dart';
// import 'package:authentication/ui/logIn_switch.dart';
// import 'package:authentication/ui/submit_button.dart';
// import 'package:core/core.dart';
// import 'package:core_ui/core_ui.dart';
// import 'package:flutter/material.dart';
// import 'package:navigation/navigation.dart';
// import 'package:authentication/authentication.dart';
//
// class SignInForm extends StatefulWidget {
//   const SignInForm({Key? key}) : super(key: key);
//
//   @override
//   State<SignInForm> createState() => _SignInFormState();
// }
//
// class _SignInFormState extends State<SignInForm> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     final MediaQueryData mediaQuery = MediaQuery.of(context);
//     final AuthenticationBloc bloc = BlocProvider.of(context);
//
//     return SingleChildScrollView(
//       child: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding_20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               AppTextField(
//                 hintText: 'Email',
//                 icon: const Icon(Icons.email),
//                 obscureText: false,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Email is required';
//                   } else if (!value.contains('@')) {
//                     return 'Invalid email format';
//                   }
//                   return null;
//                 },
//                 textEditingController: emailController,
//               ),
//               SizedBox(height: AppDimens.size_10),
//               AppTextField(
//                 hintText: 'Password',
//                 icon: Icon(Icons.password),
//                 obscureText: true,
//                 validator: (value) {
//                   return value!.length < 8
//                       ? 'The password must be at least 8 characters long'
//                       : null;
//                 },
//                 textEditingController: passwordController,
//               ),
//               SizedBox(height: AppDimens.size_10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       //context.pushRoute(
//                       //ResetPasswordRoute(),
//                       //);
//                     },
//                     child: Text(
//                       'Forgot password?',
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: AppDimens.size_10),
//               ElevatedButton(
//                 onPressed: _handleGoogleSignIn,
//                 child: Text('Sign in with Google'),
//               ),
//               SizedBox(height: AppDimens.size_10),
//               BlocListener<AuthenticationBloc, AuthenticationState>(
//                 listener: (BuildContext context, AuthenticationState state) {
//                   final SubmissionStatusForm formStatus = bloc.state.statusForm;
//                   if (formStatus is SubmissionFormFailed) {
//                     _showSnackBar(
//                       context,
//                       formStatus.exception.toString(),
//                     );
//                   }
//                   if (formStatus is SubmissionFormSuccess) {
//                     bloc.add(
//                       NavigateToMenuPage(),
//                     );
//                   }
//                 },
//                 listenWhen: (AuthenticationState previous,
//                     AuthenticationState current) {
//                   return previous.statusForm != current.statusForm;
//                 },
//                 child: SubmitButton(
//                   label: 'Sign In',
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       bloc.add(
//                         SignInSubmitted(
//                           email: emailController.text.trim(),
//                           password: passwordController.text.trim(),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ),
//               const SizedBox(height: AppDimens.size_20),
//               LogInSwitch(
//                 title: "Don't have an account?",
//                 label: 'Sign Up',
//                 onPressed: () {
//                   bloc.add(ChangeSignInPage());
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _handleGoogleSignIn() async {
//     final AuthenticationBloc bloc = BlocProvider.of(context);
//     try {
//       final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
//       final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );
//
//       // Вход в Firebase с использованием учетных данных Google
//       final UserCredential authResult = await _auth.signInWithCredential(credential);
//       final User? user = authResult.user;
//
//       // if (user != null) {
//       //   // Успешный вход через Google, переход на экран ExampleRoute
//       //   bloc.add(NavigateToMenuPage());
//       // } else {
//       //   // Ошибка входа через Google
//       //   _showSnackBar(context, 'Google Sign-In Error');
//       // }
//
//     } catch (error) {
//       // Обработка ошибок входа через Google
//       _showSnackBar(context, 'Google Sign-In Error: $error');
//     }
//   }
//
//   void _showSnackBar(BuildContext context, String message) {
//     final SnackBar snackBar = SnackBar(content: Text(message));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
//
//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
// }
//
// // import 'package:authentication/bloc/submit_status.dart';
// // import 'package:authentication/ui/app_text_field.dart';
// // import 'package:authentication/ui/logIn_switch.dart';
// // import 'package:authentication/ui/submit_button.dart';
// // import 'package:core/core.dart';
// // import 'package:core_ui/core_ui.dart';
// // import 'package:flutter/material.dart';
// // import 'package:navigation/navigation.dart';
// // import 'package:authentication/authentication.dart';
// //
// // class SignInForm extends StatefulWidget {
// //   const SignInForm({super.key});
// //
// //   @override
// //   State<SignInForm> createState() => _SignInFormState();
// // }
// //
// // class _SignInFormState extends State<SignInForm> {
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// //   final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
// //   @override
// //   Widget build(BuildContext context) {
// //     final MediaQueryData mediaQuery = MediaQuery.of(context);
// //     final AuthenticationBloc bloc = BlocProvider.of(context);
// //     return SingleChildScrollView(
// //       child: Form(
// //         key: _formKey,
// //         child: Padding(
// //           padding: const EdgeInsets.symmetric(
// //             horizontal: AppDimens.padding_20,
// //           ),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: <Widget>[
// //               AppTextField(
// //                 hintText: 'Email',
// //                 icon: const Icon(
// //                   Icons.email
// //                 ),
// //                 obscureText: false,
// //                 validator: (value) {
// //                   if (value!.isEmpty){
// //                     return 'Email is required';
// //                   } else if (!value.contains('@')) {
// //                     return 'Invalid email format';
// //                   }
// //                   return null;
// //                 },
// //                 textEditingController: emailController,
// //               ),
// //               SizedBox(height: AppDimens.size_10),
// //               AppTextField(
// //                 hintText: 'Password',
// //                 icon: Icon(
// //                   Icons.password,
// //                 ),
// //                 obscureText: true,
// //                 validator: (value) {
// //                   return value!.length < 8
// //                     ? 'The password must be at least 8 characters long'
// //                     : null;
// //                 },
// //                 textEditingController: passwordController,
// //               ),
// //               SizedBox(height: AppDimens.size_10),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.end,
// //                 children: <Widget>[
// //                   TextButton(
// //                     onPressed: () {
// //                       //context.pushRoute(
// //                         //ResetPasswordRoute(),
// //                       //);
// //                     },
// //                     child: Text(
// //                       'Forgot password?',
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               SizedBox(height: AppDimens.size_10),
// //               BlocListener<AuthenticationBloc, AuthenticationState>(
// //                 listener: (BuildContext context, AuthenticationState state) {
// //                   final SubmissionStatusForm formStatus = bloc.state.statusForm;
// //                   if (formStatus is SubmissionFormFailed) {
// //                     _showSnackBar(
// //                       context,
// //                       formStatus.exception.toString(),
// //                     );
// //                   }
// //                   if (formStatus is SubmissionFormSuccess) {
// //                     bloc.add(
// //                       NavigateToMenuPage(),
// //                     );
// //                   }
// //                 },
// //                 listenWhen: (AuthenticationState previous,
// //                     AuthenticationState current) {
// //                   return previous.statusForm != current.statusForm;
// //                 },
// //                 child: SubmitButton(
// //                   label: 'Sign In',
// //                   onPressed: () {
// //                     if (_formKey.currentState!.validate()) {
// //                       bloc.add(
// //                         SignInSubmitted(
// //                           email: emailController.text.trim(),
// //                           password: passwordController.text.trim(),
// //                         ),
// //                       );
// //                     }
// //                   },
// //                 ),
// //               ),
// //               const SizedBox(height: AppDimens.size_20),
// //               LogInSwitch(
// //                 title: "Don't have an account?",
// //                 label: 'Sign Up',
// //                 onPressed: () {
// //                   bloc.add(ChangeSignInPage());
// //                 },
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //   @override
// //   void dispose() {
// //     emailController.dispose();
// //     passwordController.dispose();
// //     super.dispose();
// //   }
// //
// //   void _showSnackBar(BuildContext context, String message) {
// //     final SnackBar snackBar = SnackBar(content: Text(message));
// //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
// //   }
// // }
