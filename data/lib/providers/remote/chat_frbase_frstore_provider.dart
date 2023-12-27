import 'package:data/data.dart';

abstract class ChatFirebaseFirestoreDataProvider {
  Future<List<Map<String, dynamic>>> getChats({
    required String loginUID,
  });
}
