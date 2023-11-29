import 'package:domain/domain.dart';

abstract class AuthenticationRepository {
  Future<UserModel> signUp({
    required String userName,
    required String email,
    required String password,
  });

  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> resetPassword({
    required String email,
  });

  Future<UserModel> getUserFromStorage();
}