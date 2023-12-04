class UserModel {
  final String identifierId;
  final String userName;
  final String email;
  final String role;

  const UserModel({
    required this.identifierId,
    required this.userName,
    required this.email,
    required this.role,
  });

  const UserModel.empty() :
        identifierId = '',
        userName = '',
        email = '',
        role = '';

  List<Object?> get props => [
    identifierId,
    userName,
    email,
    role,
  ];

  UserModel copyWith({
    String? identifierId,
    String? userName,
    String? email,
    String? role,
  }) {
    return UserModel(
      identifierId: identifierId ?? this.identifierId,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }
}