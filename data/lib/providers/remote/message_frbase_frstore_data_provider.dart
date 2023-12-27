abstract class MessageFirebaseFirestoreDataProvider {
  Future<void> addMessage({
    required Map<String, dynamic> messageMap,
  });
  Stream<List<Map<String, dynamic>>> getMessages({
    required String conversationId,
  });
}