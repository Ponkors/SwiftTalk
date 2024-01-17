import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:core/core.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final FirebaseFirestoreDataProvider firebaseFirestoreDataProvider;
  // final HiveProvider _hiveProvider;

  const ContactsRepositoryImpl({
    required this.firebaseFirestoreDataProvider,
  });

  Future<List<UserEntity>> getContacts({required String loginUID}) async {
    //final List<UserModel> users;
    final listUserMaps = await firebaseFirestoreDataProvider.getContacts(
      loginUID: loginUID,
    );
    return listUserMaps.map((userMap) => UserEntity.fromMap(userMap)).toList();
  }

  // @override
  // Future<List<UserModel>> fetchAllUsers() async {
  //   final List<UserModel> users;
  //   final List<UserEntity> result = await _firebaseFirestoreDataProvider
  //       .fetchAllUsers();
  //   users = result.map((UserEntity e) => UserMapper.toModel(e)).toList();
  //   return users;
  // }
}