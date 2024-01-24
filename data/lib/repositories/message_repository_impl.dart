import 'package:data/data.dart';
import 'package:domain/domain.dart';

class MessageRepositoryImpl implements MessageRepository {
  final MessageFirebaseFirestoreDataProvider
      _messageFirebaseFirestoreDataProvider;

  const MessageRepositoryImpl({
    required MessageFirebaseFirestoreDataProvider
        messageFirebaseFirestoreDataProvider,
  }) : _messageFirebaseFirestoreDataProvider =
            messageFirebaseFirestoreDataProvider;

  Future<void> sendMessage({required MessageModel message}) async {
    await _messageFirebaseFirestoreDataProvider.addMessage(
        messageMap: message.toMap());
  }

  Stream<List<MessageModel?>> getMessages({required String conversationId}) {
    final messageMapStream = _messageFirebaseFirestoreDataProvider.getMessages(
      conversationId: conversationId,
    );

    return messageMapStream.map(
      (event) => event.map(
        (e) {
          return e != null ? MessageModel.fromMap(e) : null;
        },
      ).toList(),
    );
  }
}
