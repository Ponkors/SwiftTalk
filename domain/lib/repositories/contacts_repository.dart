import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class ContactsRepository {
  Future<List<UserEntity>> getContacts({required String loginUID});
}