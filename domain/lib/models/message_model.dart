import 'package:core/core.dart';
import 'dart:convert';

class MessageModel {
  final String conversationId;
  final String senderUID;
  final String receiverUID;
  final String content;
  final String timeStamp;

  MessageModel({
    required this.conversationId,
    required this.senderUID,
    required this.receiverUID,
    required this.content,
    required this.timeStamp,
  });

  @override
  List<Object> get props {
    return [
      conversationId,
      senderUID,
      receiverUID,
      content,
      timeStamp,
    ];
  }

  MessageModel copyWith({
    String? conversationId,
    String? senderUID,
    String? receiverUID,
    String? content,
    String? timeStamp,
  }) {
    return MessageModel(
      conversationId: conversationId ?? this.conversationId,
      senderUID: senderUID ?? this.senderUID,
      receiverUID: receiverUID ?? this.receiverUID,
      content: content ?? this.content,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      MessageKeys.conversationId: conversationId,
      MessageKeys.senderUID: senderUID,
      MessageKeys.receiverUID: receiverUID,
      MessageKeys.content: content,
      MessageKeys.timeStamp: timeStamp,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      conversationId: map[MessageKeys.conversationId]?.toString() ?? '',
      senderUID: map[MessageKeys.senderUID]?.toString() ?? '',
      receiverUID: map[MessageKeys.receiverUID]?.toString() ?? '',
      content: map[MessageKeys.content]?.toString() ?? '',
      timeStamp: map[MessageKeys.timeStamp]?.toString() ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(conversationId: $conversationId, senderUID: $senderUID, receiverUID: $receiverUID, content: $content, timeStamp: $timeStamp)';
  }

}