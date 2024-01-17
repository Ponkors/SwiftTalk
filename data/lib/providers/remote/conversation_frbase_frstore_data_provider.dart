import 'package:data/data.dart';

abstract class ConversationFirebaseFirestoreDataProvider {
  Future<Map<String, dynamic>?> getConversationId({
    required String senderUID,
    required String receiverUID,
  });

  Future<String> createConversation({
    required Map<String, dynamic> conversation,
  });
}
