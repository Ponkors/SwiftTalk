import 'package:data/data.dart';

abstract class FirebaseFirestoreDataProvider {

  Future<List<Map<String, dynamic>>> getContacts({
    required String loginUID,
  });
  // Future<List<UserEntity>> fetchAllUsers();
  Future<void> updateUserRole({
    required String uid,
    required String role,
  });
  Future<UserEntity> getUser({
    required String uid,
  });
  Future<void> saveUser({
    required String uid,
    required String? userName,
    required String? email,
  });
}