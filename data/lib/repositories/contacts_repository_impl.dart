import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:core/core.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final FirebaseFirestoreDataProvider _firebaseFirestoreDataProvider;
  final HiveProvider _hiveProvider;

  const ContactsRepositoryImpl({
    required FirebaseFirestoreDataProvider firebaseFirestoreDataProvider,
    required HiveProvider hiveProvider,
  }) : _firebaseFirestoreDataProvider = firebaseFirestoreDataProvider,
       _hiveProvider = hiveProvider;

  @override
  Future<List<UserEntity>> getContacts() async {
    //final List<UserModel> users;
    final listUserMaps = await _firebaseFirestoreDataProvider
        .getContacts();
    return listUserMaps.map((userMap) => UserEntity.fromMap(userMap)).toList();
  }

  @override
  Future<List<UserModel>> fetchAllUsers() async {
    final List<UserModel> users;
    final List<UserEntity> result = await _firebaseFirestoreDataProvider
        .fetchAllUsers();
    users = result.map((UserEntity e) => UserMapper.toModel(e)).toList();
    return users;
  }
}