import 'package:core/core.dart';
import 'user_entity.dart';

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  int get typeId => 0;

  @override
  UserEntity read(BinaryReader reader) {
    final fieldsCount = reader.readByte();
    Map<String, dynamic> data = {};
    for (int i = 0; i < fieldsCount; i++) {
      final key = reader.readString();
      final value = reader.read();
      data[key] = value;
    }
    return UserEntity(
      identifierId: data['identifierId'] ?? '',
      userName: data['userName'] ?? '',
      email: data['email'] ?? '',
      photoURL: data['photoURL'] ?? '',
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer.writeByte(4);
    writer.writeString('identifierId');
    writer.write(obj.identifierId);
    writer.writeString('userName');
    writer.write(obj.userName);
    writer.writeString('email');
    writer.write(obj.email);
    writer.writeString('photoURL');
    writer.write(obj.photoURL);
  }
}