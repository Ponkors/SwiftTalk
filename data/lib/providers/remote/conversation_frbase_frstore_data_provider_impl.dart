import 'package:core/core.dart';
import 'package:data/data.dart';
import 'dart:developer';

class ConversationFirebaseFirestoreDataProviderImpl
    implements ConversationFirebaseFirestoreDataProvider {
  final FirebaseFirestore _firebaseFirestore;

  const ConversationFirebaseFirestoreDataProviderImpl({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;


  @override
  Future<Map<String, dynamic>?> getConversationId({
    required senderUID,
    required receiverUID,
  }) async {
    final members = [senderUID, receiverUID];
    final conversationQuerySnap = await _firebaseFirestore
        .collection(ConversationKey.collectionName)
        .where(ConversationKey.members,
          whereIn: [
            members,
            members.reversed.toList(),
          ],
    ).get();
    log(conversationQuerySnap.docs.length.toString());
    if (conversationQuerySnap.docs.isNotEmpty) {
      return conversationQuerySnap.docs.first.data();
    }
    return null;
  }
  
  @override
  Future<String> createConversation({
    required Map<String, dynamic> conversation,
  }) async {
    final conversationRef = await _firebaseFirestore
        .collection(ConversationKey.collectionName)
        .add(conversation);
    await conversationRef.update({ConversationKey.id: conversationRef.id});
    return conversationRef.id;
  }
}
