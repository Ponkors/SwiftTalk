part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class AuthenticationWithGooglePressed extends AuthenticationEvent {}

class AuthenticationVerified extends AuthenticationEvent {}

class AuthenticationStateChanged extends AuthenticationEvent {
  final UserEntity? user;

  AuthenticationStateChanged({
    this.user,
  });
}

class AuthenticationRemoved extends AuthenticationEvent {}




