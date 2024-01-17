import 'dart:convert';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable{
  final String identifierId;
  final String userName;
  final String email;
  final String photoURL;

  const UserModel({
    required this.identifierId,
    required this.userName,
    required this.email,
    required this.photoURL,
  });

  const UserModel.empty() :
        identifierId = '',
        userName = '',
        email = '',
        photoURL = '';


  List<Object?> get props => [identifierId, userName, email, photoURL];

  UserModel copyWith({
    String? identifierId,
    String? userName,
    String? email,
    String? photoURL,
  }) {
    return UserModel(
      identifierId: identifierId ?? this.identifierId,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      photoURL: photoURL ?? this.photoURL,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      'identifierId': identifierId,
      'userName': userName,
      'email': email,
      'photoURL': photoURL,
    };
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      identifierId: map['identifierId']?.toString() ?? '',
      userName: map['userName']?.toString() ?? '',
      email: map['email']?.toString() ?? '',
      photoURL: map['photoURL']?.toString() ?? '',
    );
  }

  @override
  String toString() {
    return 'AppUser(identifierId: $identifierId, userName: $userName, '
        'email: $email, photoURL: $photoURL)';
  }
}