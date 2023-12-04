import 'package:domain/domain.dart';

class SignUpUseCase implements FutureUseCase<SignUpParameters, UserModel> {
  final AuthenticationRepository _authenticationRepository;

  SignUpUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<UserModel> execute(SignUpParameters params) async {
    return _authenticationRepository.signUp(
      userName: params.userName,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParameters {
  final String userName;
  final String email;
  final String password;

  SignUpParameters({
    required this.userName,
    required this.email,
    required this.password,
  });
}