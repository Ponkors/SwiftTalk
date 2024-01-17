import 'dart:convert';
import 'package:core/core.dart';

class UserEntity extends Equatable {
  final String identifierId;
  final String userName;
  final String email;
  final String photoURL;

   UserEntity({
    required this.identifierId,
    required this.userName,
    required this.email,
    required this.photoURL,
  });

  UserEntity copyWith({
    String? identifierId,
    String? userName,
    String? email,
    String? photoURL,
  }) {
    return UserEntity(
      identifierId: identifierId ?? this.identifierId,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      photoURL: photoURL ?? this.photoURL,
    );
  }


  List<Object> get props => [identifierId, userName, email, photoURL];

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      'identifierId': identifierId,
      'userName': userName,
      'email': email,
      'photoURL': photoURL,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      identifierId: map['identifierId']?.toString() ?? '',
      userName: map['userName']?.toString() ?? '',
      email: map['email']?.toString() ?? '',
      photoURL: map['photoURL']?.toString() ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserEntity(identifierId: $identifierId, userName: $userName, email: $email,'
        'photoURL: $photoURL)';
  }
}