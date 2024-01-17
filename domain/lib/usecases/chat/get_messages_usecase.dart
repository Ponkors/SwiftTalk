// import 'package:domain/domain.dart';
// import 'package:data/data.dart';
//
//
// class GetMessagesUseCase {
//   final ChatRepository _chatRepository;
//
//   GetMessagesUseCase(this._chatRepository);
//
//   Stream<List<MessageEntity>> execute(String userId, String otherUserId) {
//     return _chatRepository.getMessages(userId, otherUserId).map(
//           (QuerySnapshot snapshot) {
//         return snapshot.docs.map((doc) => MessageEntity.fromMap(doc.data())).toList();
//       },
//     );
//   }
// }