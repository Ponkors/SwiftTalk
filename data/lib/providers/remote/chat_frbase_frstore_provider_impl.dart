import 'package:core/core.dart';
import 'package:data/data.dart';

class ChatFirebaseFirestoreDataProviderImpl
    implements ChatFirebaseFirestoreDataProvider {
  final FirebaseFirestore _firebaseFirestore;

  const ChatFirebaseFirestoreDataProviderImpl({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Future<List<Map<String, dynamic>>> getChats({
    required String loginUID,
  }) async {
    final querySnap = await _firebaseFirestore
        .collection(ConversationKey.collectionName)
        .where(ConversationKey.members, arrayContains: loginUID)
        .get();
    return querySnap.docs.map((e) => e.data()).toList();
  }
}
