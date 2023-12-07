import 'package:domain/domain.dart';

class SignInWithGoogleUseCase implements FutureUseCase<NoParams, UserModel> {
  final AuthenticationRepository _authRepository;

  SignInWithGoogleUseCase({
    required AuthenticationRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<UserModel> execute(NoParams input) async {
    return _authRepository.signInWithGoogle();
  }
}