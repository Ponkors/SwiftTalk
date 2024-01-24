import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class ConversationRepositoryImpl implements ConversationRepository {
  final FirebaseFirestore _firebaseFirestore;
  final ConversationFirebaseFirestoreDataProvider
      _conversationFirebaseFirestoreDataProvider;

  const ConversationRepositoryImpl({
    required FirebaseFirestore firebaseFirestore,
    required ConversationFirebaseFirestoreDataProvider
        conversationFirebaseFirestoreDataProvider,
  })  : _firebaseFirestore = firebaseFirestore,
        _conversationFirebaseFirestoreDataProvider =
            conversationFirebaseFirestoreDataProvider;

  @override
  Future<ConversationModel?> getConversation({
    required String senderUID,
    required String receiverUID,
  }) async {
    final conversationMap =
        await _conversationFirebaseFirestoreDataProvider.getConversationId(
      senderUID: senderUID,
      receiverUID: receiverUID,
    );
    if (conversationMap == null) {
      return null;
    } else {
      return ConversationModel.fromMap(conversationMap);
    }
  }

  @override
  Future<String> createConversation({
    required ConversationModel conversation,
  }) async {
    final conversationId =
        await _conversationFirebaseFirestoreDataProvider.createConversation(
      conversation: conversation.toMap(),
    );
    return conversationId;
  }
}
