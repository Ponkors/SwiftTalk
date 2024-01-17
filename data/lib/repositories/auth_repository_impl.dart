import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseAuthProviderImpl firebaseAuthProviderImpl;

  AuthenticationRepositoryImpl({
    required this.firebaseAuthProviderImpl,
  });

  Future<UserEntity?> loginWithGoogle() async {
    final firebaseUser = await firebaseAuthProviderImpl.loginWithGoogle();
    return firebaseUser == null
        ? null
        : UserEntity(
            identifierId: firebaseUser.uid,
            userName: firebaseUser.displayName ?? '',
            email: firebaseUser.email ?? '',
            photoURL: firebaseUser.photoURL ?? '',
          );
  }

  Stream<bool> isLoggedIn() {
    final streamOfUser = firebaseAuthProviderImpl.getLoggedInUserStates();
    return streamOfUser.map((user) => user != null);
  }

  Stream<UserEntity?> getLoggedInUser() {
    final loggedInUserStream = firebaseAuthProviderImpl.getLoggedInUserStates();
    return loggedInUserStream.map((firebaseUser) {
      if (firebaseUser == null) {
        return null;
      } else {
        return UserEntity(
          identifierId: firebaseUser.uid,
          userName: firebaseUser.displayName ?? '',
          email: firebaseUser.email ?? '',
          photoURL: firebaseUser.photoURL ?? '',
        );
      }
    });
  }

  Future<void> logOut() async {
    await firebaseAuthProviderImpl.logOut();
  }

  // final FirebaseAuthProvider _firebaseAuthProvider;
  // final HiveProvider _hiveProvider;
  //
  // const AuthenticationRepositoryImpl({
  //   required FirebaseAuthProvider firebaseAuthProvider,
  //   required HiveProvider hiveProvider,
  // })  : _firebaseAuthProvider = firebaseAuthProvider,
  //       _hiveProvider = hiveProvider;
  //
  // @override
  // Future<UserModel> signUp({
  //   required String userName,
  //   required String email,
  //   required String password,
  // }) async {
  //   final UserEntity userEntity =
  //   await _firebaseAuthProvider.signUpWithEmailAndPassword(
  //     userName: userName,
  //     email: email,
  //     password: password,
  //   );
  //   final UserModel userModel = UserMapper.toModel(userEntity);
  //   await _hiveProvider.saveUserToLocal(userModel);
  //   return userModel;
  // }
  //
  // @override
  // Future<UserModel> signIn({
  //   required String email,
  //   required String password,
  // }) async {
  //   final UserEntity userEntity =
  //   await _firebaseAuthProvider.signInWithEmailAndPassword(
  //     email: email,
  //     password: password,
  //   );
  //   final UserModel userModel = UserMapper.toModel(userEntity);
  //   await _hiveProvider.saveUserToLocal(userModel);
  //   return userModel;
  // }
  //
  // @override
  // Future<void> signOut() async {
  //   await _firebaseAuthProvider.signOut();
  //   await _hiveProvider.deleteUserFromLocal();
  // }
  //
  // @override
  // Future<void> resetPassword({
  //   required String email,
  // }) async {
  //   await _firebaseAuthProvider.resetPassword(email: email);
  // }
  //
  // @override
  // Future<UserModel> getUserFromStorage() async {
  //   final UserEntity userEntity = await _hiveProvider.getUserFromLocal();
  //   return UserMapper.toModel(userEntity);
  // }
  //
  // @override
  // Future<UserModel> signInWithGoogle() async {
  //   final UserEntity userEntity =
  //   await _firebaseAuthProvider.signInWithGoogle();
  //   final UserModel userModel = UserMapper.toModel(userEntity);
  //   await _hiveProvider.saveUserToLocal(userModel);
  //   return userModel;
  // }
}