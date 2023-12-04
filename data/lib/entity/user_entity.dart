import 'package:core/core.dart';

class UserEntity {
  final String identifierId;
  final String userName;
  final String email;
  final String role;

  const UserEntity({
    required this.identifierId,
    required this.userName,
    required this.email,
    required this.role
  });

  List<Object?> get props => [
    identifierId,
    userName,
    email,
    role,
  ];

  const UserEntity.empty()
      : identifierId = '',
        userName = '',
        email = '',
        role = '';

  Map<String,dynamic> toJson() {
    return {
      'identifierId': identifierId,
      'name': userName,
      'email': email,
      'role': role,
    };
  }

  factory UserEntity.fromJson(
      Map<String, dynamic> json,
      ) {
    return UserEntity(
      identifierId: json['uid'] ?? '',
      email: json['email'] ?? '',
      userName: json['name'] ?? '',
      role: json['role'] ?? '',
    );
  }

  factory UserEntity.fromFirebase(
      DocumentSnapshot<Map<String, dynamic>> document,
      ) {
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return UserEntity.fromJson(data);
  }
}