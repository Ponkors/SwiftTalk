import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class ConversationRepository {
  Future<ConversationModel?> getConversation({
    required String senderUID,
    required String receiverUID,
  });
  Future<String> createConversation({
    required ConversationModel conversation,
  });
}