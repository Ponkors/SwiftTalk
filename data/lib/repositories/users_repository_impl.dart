import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:core/core.dart';

class UsersRepositoryImpl implements UsersRepository {
  final FirebaseFirestoreDataProvider _firebaseFirestoreDataProvider;
  final HiveProvider _hiveProvider;

  const UsersRepositoryImpl({
    required FirebaseFirestoreDataProvider firebaseFirestoreDataProvider,
    required HiveProvider hiveProvider,
  }) : _firebaseFirestoreDataProvider = firebaseFirestoreDataProvider,
       _hiveProvider = hiveProvider;

  @override
  Future<List<UserModel>> fetchAllUsers() async {
    final List<UserModel> users;
    final List<UserEntity> result = await _firebaseFirestoreDataProvider
        .fetchAllUsers();
    users = result.map((UserEntity e) => UserMapper.toModel(e)).toList();
    return users;
  }
}