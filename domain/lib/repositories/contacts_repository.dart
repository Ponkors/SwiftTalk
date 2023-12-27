import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class ContactsRepository {
  Future<List<UserEntity>> getContacts();
  Future<List<UserModel>> fetchAllUsers();
}