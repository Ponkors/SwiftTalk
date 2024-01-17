part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final UserEntity user;

  AuthenticationSuccess({
    required this.user,
  });
}

class AuthenticationRemoveSuccess extends AuthenticationState {}

class AuthenticationInProgress extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {}

