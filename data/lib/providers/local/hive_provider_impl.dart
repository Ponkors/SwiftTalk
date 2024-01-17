// import 'package:core/core.dart';
// import 'package:data/data.dart';
// import 'package:domain/domain.dart';
//
// class HiveProviderImpl implements HiveProvider {
//
//   @override
//   Future<void> saveUserToLocal(UserModel userModel) async {
//     final Box<UserEntity> userBox = await Hive.openBox('user');
//     final UserEntity userEntity = UserMapper.toEntity(userModel);
//     await userBox.add(userEntity);
//   }
//
//   @override
//   Future<UserEntity> getUserFromLocal() async {
//     final Box<UserEntity> userBox = await Hive.openBox('user');
//     return userBox.isNotEmpty ? userBox.values.first : const UserEntity();
//   }
//
//   @override
//   Future<void> deleteUserFromLocal() async {
//     final Box<UserEntity> userBox = await Hive.openBox('user');
//     await userBox.clear();
//   }
// }