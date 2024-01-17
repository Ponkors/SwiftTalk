// import 'package:authentication/bloc/submit_status.dart';
// import 'package:authentication/ui/app_text_field.dart';
// import 'package:authentication/ui/submit_button.dart';
// import 'package:core/core.dart';
// import 'package:core_ui/core_ui.dart';
// import 'package:authentication/authentication.dart';
// import 'package:flutter/material.dart';
//
// class ResetPasswordForm extends StatefulWidget {
//   const ResetPasswordForm({super.key});
//
//   @override
//   State<ResetPasswordForm> createState() => _ResetPasswordFormState();
// }
//
// class _ResetPasswordFormState extends State<ResetPasswordForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final AuthenticationBloc bloc = BlocProvider.of(context);
//
//     return SingleChildScrollView(
//       child: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: AppDimens.padding40,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               AppTextField(
//                 hintText: 'authenticationScreen.email',
//                 icon: const Icon(
//                   Icons.email_outlined,
//                 ),
//                 obscureText: false,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'authenticationScreen.emailRequired';
//                   } else if (!value.contains('@')) {
//                     return 'authenticationScreen.emailFormatWrong';
//                   }
//                   return null;
//                 },
//                 textEditingController: emailController,
//               ),
//               const SizedBox(
//                 height: AppDimens.size30,
//               ),
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
//                     _showSnackBar(
//                       context,
//                       'authenticationScreen.checkEmail',
//                     );
//                     bloc.add(
//                       NavigateToSignInScreen(),
//                     );
//                   }
//                 },
//                 listenWhen: (AuthenticationState previous, AuthenticationState current) {
//                   return current.statusForm != previous.statusForm;
//                 },
//                 child: SubmitButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       bloc.add(
//                         ResetPasswordSubmitted(
//                           email: emailController.text.trim(),
//                         ),
//                       );
//                     }
//                   },
//                   label: 'authenticationScreen.resetPassword',
//                 ),
//               ),
//               const SizedBox(
//                 height: AppDimens.size_10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   TextButton(
//                       onPressed: () {
//                         bloc.add(ChangeResetPasswordPage());
//                       },
//                       child: Text(
//                         'authenticationScreen.signIn',
//                       ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
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
//     super.dispose();
//   }
// }