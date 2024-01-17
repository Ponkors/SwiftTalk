// import 'package:domain/domain.dart';
//
// class SignInUseCase implements FutureUseCase<SignInParameters, UserModel> {
//   final AuthenticationRepository _authenticationRepository;
//
//   SignInUseCase({
//     required AuthenticationRepository authenticationRepository,
//   }) : _authenticationRepository = authenticationRepository;
//
//   @override
//   Future<UserModel> execute(SignInParameters params) async {
//     return _authenticationRepository.signIn(
//       email: params.email,
//       password: params.password,
//     );
//   }
// }
//
// class SignInParameters {
//   final String email;
//   final String password;
//
//   SignInParameters({
//     required this.email,
//     required this.password
//   });
// }