import 'package:data/data.dart';

abstract class AuthenticationRepository {
  Future<UserEntity?> loginWithGoogle();
  Stream<bool> isLoggedIn();
  Stream<UserEntity?> getLoggedInUser();
  Future<void> logOut();
}
