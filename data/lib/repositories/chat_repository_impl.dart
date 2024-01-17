import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class ChatRepositoryImpl implements ChatRepository {
  final FirebaseFirestore _firebaseFirestore;
  final ChatFirebaseFirestoreDataProvider _chatFirebaseFirestoreDataProvider;

  const ChatRepositoryImpl({
    required FirebaseFirestore firebaseFirestore,
    required ChatFirebaseFirestoreDataProvider chatFirebaseFirestoreDataProvider,
  }) : _firebaseFirestore = firebaseFirestore,
       _chatFirebaseFirestoreDataProvider = chatFirebaseFirestoreDataProvider;

  @override
  Future<List<ConversationModel>> getChats({
    required String loginUID
  }) async {
    final chatMaps = await _chatFirebaseFirestoreDataProvider.getChats(
      loginUID: loginUID
    );
    return chatMaps.map((chatMap) => ConversationModel.fromMap(chatMap)).toList();
  }
}

/*
Future<void> sendMessage(String receiverId, String message) async {
  final String currentUserId = _firebaseAuth.currentUser!.uid;
  final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
  final Timestamp timestamp = Timestamp.now();

  MessageEntity newMessage = MessageEntity(
    senderId: currentUserId,
    senderEmail: currentUserEmail,
    receiverId: receiverId,
    message: message,
    timestamp: timestamp,
  );

  List<String> ids = [currentUserId, currentUserEmail];
  ids.sort(); // the same ids (id is always the same for any pair)
  String chatRoomId = ids.join("_"); //combine ids to a single string to use as a chatroomID

  await _firebaseFirestore
      .collection('chat_rooms')
      .doc(chatRoomId)
      .collection('messages')
      .add(newMessage.toMap());
}

Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
  List<String> ids = [userId, otherUserId];
  ids.sort();
  String chatRoomId = ids.join("_");

  return _firebaseFirestore
      .collection('chat_rooms')
      .doc(chatRoomId)
      .collection('messages')
      .orderBy('timestamp', descending: false)
      .snapshots();

 */