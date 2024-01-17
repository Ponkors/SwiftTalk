import 'package:domain/domain.dart';

abstract class ChatRepository {
  Future<List<ConversationModel>> getChats({
    required String loginUID,
  });
}