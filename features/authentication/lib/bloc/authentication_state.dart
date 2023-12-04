part of 'authentication_bloc.dart';

class AuthenticationState {
  final UserModel userModel;
  final bool isLogged;
  final SubmissionStatusForm statusForm;
  final bool isSignInPage;
  final bool isResetPasswordPage;

  AuthenticationState({
    required this.userModel,
    required this.isLogged,
    required this.statusForm,
    required this.isSignInPage,
    required this.isResetPasswordPage,
  });

  AuthenticationState.empty() :
        userModel = const UserModel.empty(),
        isLogged = false,
        statusForm = const InitSubmitStatus(),
        isSignInPage = true,
        isResetPasswordPage = false;

  AuthenticationState copyWith({
    UserModel? userModel,
    bool? isLogged,
    SubmissionStatusForm? statusForm,
    bool? isSignInPage,
    bool? isResetPasswordPage,
  }) {
    return AuthenticationState(
      userModel: userModel ?? this.userModel,
      isLogged: isLogged ?? this.isLogged,
      statusForm: statusForm ?? this.statusForm,
      isSignInPage: isSignInPage ?? this.isSignInPage,
      isResetPasswordPage: isResetPasswordPage ?? this.isResetPasswordPage,
    );
  }
}