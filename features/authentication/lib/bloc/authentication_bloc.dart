import 'dart:async';
import 'dart:developer';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:navigation/navigation.dart';
import 'package:authentication/authentication.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {

  final AuthenticationRepository authenticationRepository;
  late StreamSubscription isAuthenticationStates;

  AuthenticationBloc({
    required this.authenticationRepository,
  }) : super(AuthenticationInitial()) {
    on<AuthenticationWithGooglePressed>(_onAuthenticationWithGoogle);
    on<AuthenticationVerified>(_onAuthenticationVerified);
    on<AuthenticationStateChanged>(_onAuthenticationStateChanged);
    on<AuthenticationRemoved>(_onAuthenticationRemoved);
  }

  @override
  Future<void> close() {
    isAuthenticationStates.cancel();
    return super.close();
  }

  Future<void> _onAuthenticationWithGoogle(
    AuthenticationWithGooglePressed event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(AuthenticationInProgress());
      final authenticatedUser =
          await authenticationRepository.loginWithGoogle();
      log('Logged user: ${authenticatedUser?.userName}, '
          'email: ${authenticatedUser?.email}');
      emit(
        authenticatedUser == null
            ? AuthenticationFailure()
            : AuthenticationSuccess(user: authenticatedUser),
      );
    } catch (any) {
      log('Error while login with google ${any.toString()}');
      emit(AuthenticationFailure());
    }
  }

  void _onAuthenticationVerified(
      AuthenticationVerified event, Emitter<AuthenticationState> emit) {
    try {
      emit(AuthenticationInProgress());
      isAuthenticationStates =
          authenticationRepository.getLoggedInUser().listen((user) {
        add(AuthenticationStateChanged(user: user));
      });
    } catch (e) {
      log('Error while checking for authentication state ${state.toString()}');
      emit(AuthenticationFailure());
    }
  }

  FutureOr<void> _onAuthenticationStateChanged(
    AuthenticationStateChanged event,
    Emitter<AuthenticationState> emit,
  ) {
    final user = event.user;
    emit(user == null
        ? AuthenticationFailure()
        : AuthenticationSuccess(user: user));
  }

  FutureOr<void> _onAuthenticationRemoved(
    AuthenticationRemoved event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      emit(AuthenticationInProgress());
      await authenticationRepository.logOut();
    } catch (e) {
      log('Unknown error while logout ${e.toString()}');
      AuthenticationFailure();
    }
  }
}
