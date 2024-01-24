import 'package:data/data.dart';
import 'package:core/core.dart';

class FirebaseFirestoreDataProviderImpl
    implements FirebaseFirestoreDataProvider {
  final FirebaseFirestore _firebaseFirestore;

  const FirebaseFirestoreDataProviderImpl({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Future<List<Map<String, dynamic>>> getContacts({
    required String loginUID,
  }) async {
    final userQuerySnap = await _firebaseFirestore
        .collection('users')
        .where('identifierId', isNotEqualTo: loginUID)
        .get();
    return userQuerySnap.docs
        .map((queryDocSnap) => queryDocSnap.data())
        .toList();
  }

  @override
  Future<UserEntity> getUser({
    required String uid,
  }) async {
    final DocumentSnapshot<Map<String, dynamic>> userDoc =
        await _firebaseFirestore.collection('users').doc(uid).get();
    final Map<String, dynamic>? userData = userDoc.data();
    final UserEntity userEntity = UserEntity(
      identifierId: uid,
      email: userData?['email'] ?? '',
      userName: userData?['name'] ?? '',
      photoURL: userData?['photoURL'] ?? '',
    );
    return userEntity;
  }

  @override
  Future<void> saveUser({
    required String uid,
    required String? userName,
    required String? email,
  }) async {
    final DocumentReference<Map<String, dynamic>> userDataFirebase =
        _firebaseFirestore.collection('users').doc(uid);
    final Map<String, String?> userData = {
      'identifierId': uid,
      'name': userName,
      'email': email,
    };
    final DocumentSnapshot<Map<String, dynamic>> user =
        await userDataFirebase.get();
    if (!user.exists) {
      userDataFirebase.set(userData);
    }
  }

  // @override
  // Future<List<UserEntity>> fetchAllUsers() async {
  //   final QuerySnapshot<Map<String, dynamic>> dataRef =
  //   await _firebaseFirestore.collection('users').get();
  //
  //   return dataRef.docs.map((
  //       QueryDocumentSnapshot<Map<String, dynamic>> user,
  //       ) {
  //     return UserEntity.fromFirebase(user);
  //   }).toList();
  // }

  @override
  Future<Stream<QuerySnapshot>> getUserByUserName(String userName) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where("name")
        .snapshots();
  }

  @override
  Future<void> updateUserRole({
    required String uid,
    required String role,
  }) async {
    final CollectionReference<Map<String, dynamic>> usersDataFirebase =
        _firebaseFirestore.collection('users');

    await usersDataFirebase.doc(uid).update({
      "role": role,
    });
  }
}
