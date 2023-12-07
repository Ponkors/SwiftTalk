import 'package:domain/domain.dart';

abstract class UsersRepository {
  Future<List<UserModel>> fetchAllUsers();
}