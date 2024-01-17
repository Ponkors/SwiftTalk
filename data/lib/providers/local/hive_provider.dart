import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class HiveProvider {
  Future<UserEntity> getUserFromLocal();
  Future<void> saveUserToLocal(UserModel userModel);
  Future<void> deleteUserFromLocal();
  //---------------------------------------------------------------------------
}