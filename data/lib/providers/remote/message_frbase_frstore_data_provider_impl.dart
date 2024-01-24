import 'package:core/core.dart';
import 'package:data/data.dart';

class MessageFirebaseFirestoreDataProviderImpl
    implements MessageFirebaseFirestoreDataProvider {
  final FirebaseFirestore _firebaseFirestore;

  MessageFirebaseFirestoreDataProviderImpl({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  Future<void> addMessage({required Map<String, dynamic> messageMap}) async {
    await _firebaseFirestore.collection(MessageKeys.collection).add(messageMap);
  }

  Stream<List<Map<String, dynamic>>> getMessages({
    required String conversationId,
  }) {
    final querySnapShotStream = _firebaseFirestore
        .collection(MessageKeys.collection)
        .where(MessageKeys.conversationId, isEqualTo: conversationId)
        .orderBy(MessageKeys.timeStamp, descending: true)
        .snapshots();

    return querySnapShotStream.map(
      (event) => event.docs.map((e) => e.data()).toList(),
    );
  }
}
