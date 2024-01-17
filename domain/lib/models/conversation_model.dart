import 'package:core/core.dart';
import 'package:data/data.dart';
import 'dart:convert';
import 'package:domain/domain.dart';

class ConversationModel extends Equatable {
  final String? id;
  final UserEntity creator;
  final UserEntity receiver;
  final List<String> members;

  const ConversationModel({
    this.id,
    required this.creator,
    required this.receiver,
    required this.members,
  });

  @override
  List<Object> get props => [creator, receiver, members];

  ConversationModel copyWith({
    String? id,
    UserEntity? creator,
    UserEntity? receiver,
    List<String>? members,
  }) {
    return ConversationModel(
      id: id ?? this.id,
      creator: creator ?? this.creator,
      receiver: receiver ?? this.receiver,
      members: members ?? this.members,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      ConversationKey.id: id,
      ConversationKey.creator: creator.toMap(),
      ConversationKey.receiver: receiver.toMap(),
      ConversationKey.members: members,
    };
  }

  factory ConversationModel.fromMap(Map<String, dynamic> map) {
    return ConversationModel(
      id: map[ConversationKey.id]?.toString(),
      creator: UserEntity.fromMap(map[ConversationKey.creator]
          as Map<String, dynamic>),
      receiver: UserEntity.fromMap(map[ConversationKey.receiver]
          as Map<String, dynamic>),
      members: List<String>.from(map[ConversationKey.members]
          as List<dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConversationModel.fromJson(String source) =>
      ConversationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Conversation(id: $id, creator: $creator, receiver: $receiver, members: $members)';
  }
}