import 'package:authentication/bloc/submit_status.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';
import 'package:authentication/authentication.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final SignOutUseCase _signOutUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final GetUserFromStorageUseCase _getUserFromStorageUseCase;
  final AppRouter _appRouter;

  AuthenticationBloc({
    required SignInUseCase signInUseCase,
    required SignUpUseCase signUpUseCase,
    required SignOutUseCase signOutUseCase,
    required ResetPasswordUseCase resetPasswordUseCase,
    required GetUserFromStorageUseCase getUserFromStorageUseCase,
    required AppRouter appRouter,
  })  : _signInUseCase = signInUseCase,
        _signUpUseCase = signUpUseCase,
        _signOutUseCase = signOutUseCase,
        _resetPasswordUseCase = resetPasswordUseCase,
        _getUserFromStorageUseCase = getUserFromStorageUseCase,
        _appRouter = appRouter,
        super(
        AuthenticationState.empty(),
      ) {
    on<InitAuthentication>(_initAuthentication);
    on<SignInSubmitted>(_signInSubmitted);
    on<SignUpSubmitted>(_signUpSubmitted);
    on<SignOutSubmitted>(_signOutSubmitted);
    on<ResetPasswordSubmitted>(_resetPassword);
    on<NavigateToMenuPage>(_navigateToMenuPage);
    on<NavigateToSignInScreen>(_navigateToSignInScreen);
    on<ChangeSignInPage>(_changeSignPage);
    on<ChangeResetPasswordPage>(_changeResetPasswordPage);
  }

  Future<void> _initAuthentication(
      InitAuthentication event,
      Emitter<AuthenticationState> emit,
      ) async {
    final UserModel userFromStorage = await _getUserFromStorageUseCase
        .execute(
      const NoParams(),
    );
    if (userFromStorage.identifierId == '') {
      emit(
        state.copyWith(
          userModel: const UserModel.empty(),
          isLogged: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLogged: true,
          userModel: userFromStorage,
        ),
      );
    }
  }

  Future<void> _signInSubmitted(
      SignInSubmitted event,
      Emitter<AuthenticationState> emit,
      ) async {
    emit(
      state.copyWith(
        statusForm: FormSubmitting(),
      ),
    );
    try {
      final UserModel userModel = await _signInUseCase.execute(
        SignInParameters(
          email: event.email,
          password: event.password,
        ),
      );
      emit(
        state.copyWith(
          statusForm: SubmissionFormSuccess(),
          userModel: userModel,
        ),
      );
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          statusForm: SubmissionFormFailed(error.message),
        ),
      );
    }
  }

  Future<void> _signUpSubmitted(
      SignUpSubmitted event,
      Emitter<AuthenticationState> emit,
      ) async {
    emit(
      state.copyWith(
        statusForm: FormSubmitting(),
      ),
    );
    try {
      final UserModel userModel = await _signUpUseCase.execute(
        SignUpParameters(
          email: event.email,
          password: event.password,
          userName: event.userName,
        ),
      );
      emit(
        state.copyWith(
          statusForm: SubmissionFormSuccess(),
          userModel: userModel,
        ),
      );
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          statusForm: SubmissionFormFailed(error.message),
        ),
      );
    }
  }

  Future<void> _signOutSubmitted(
      SignOutSubmitted event,
      Emitter<AuthenticationState> emit,
      ) async {
    await _signOutUseCase.execute(
      const NoParams(),
    );
    emit(state.copyWith(isLogged: false));
  }


  Future<void> _resetPassword(
      ResetPasswordSubmitted event,
      Emitter<AuthenticationState> emit,
      ) async {
    try {
      await _resetPasswordUseCase.execute(event.email);
      emit(
        state.copyWith(
          statusForm: SubmissionFormSuccess(),
        ),
      );
    } on FirebaseAuthException catch (error) {
      emit(
        state.copyWith(
          statusForm: SubmissionFormFailed(error.message),
        ),
      );
    }
  }

  void _navigateToMenuPage(
      NavigateToMenuPage event,
      Emitter<AuthenticationState> emit,
      ) {
    _appRouter.replace(const ExampleRoute());
  }

  void _navigateToSignInScreen(
      NavigateToSignInScreen event,
      Emitter<AuthenticationState> emit,
      ) {
    _appRouter.replace(const LogInRoute());
  }


  void _changeSignPage(
      ChangeSignInPage event,
      Emitter<AuthenticationState> emit,
      ) {
    emit(
      state.copyWith(
        isSignInPage: !state.isSignInPage,
      ),
    );
  }

  void _changeResetPasswordPage(
      ChangeResetPasswordPage event,
      Emitter<AuthenticationState> emit,
      ) {
    emit(
      state.copyWith(
        isResetPasswordPage: !state.isResetPasswordPage,
      ),
    );
  }
}