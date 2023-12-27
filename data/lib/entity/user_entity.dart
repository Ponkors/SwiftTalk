import 'package:core/core.dart';

class UserEntity {
  final String identifierId;
  final String userName;
  final String email;
  final String photoURL;

  const UserEntity({
    required this.identifierId,
    required this.userName,
    required this.email,
    required this.photoURL,
  });

  List<Object?> get props => [
    identifierId,
    userName,
    email,
    photoURL,
  ];

  const UserEntity.empty()
      : identifierId = '',
        userName = '',
        email = '',
        photoURL = '';

  Map<String,dynamic> toJson() {
    return {
      'identifierId': identifierId,
      'name': userName,
      'email': email,
      'photoURL': photoURL,
    };
  }

  factory UserEntity.fromJson(
      Map<String, dynamic> json,
      ) {
    return UserEntity(
      identifierId: json['uid'] ?? '',
      email: json['email'] ?? '',
      userName: json['name'] ?? '',
      photoURL: json['photoURL'] ?? '',
    );
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      identifierId: map['identifierId'] ?? '',
      userName: map['name'] ?? '',
      email: map['email'] ?? '',
      photoURL: map['role'] ?? '',
    );
  }

  factory UserEntity.fromFirebase(
      DocumentSnapshot<Map<String, dynamic>> document,
      ) {
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return UserEntity.fromJson(data);
  }
}