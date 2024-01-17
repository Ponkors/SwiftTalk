import 'package:domain/domain.dart';

abstract class MessageRepository {
  Future<void> sendMessage({
    required MessageModel message,
  });

  Stream<List<MessageModel?>> getMessages({
    required String conversationId,
  });
}