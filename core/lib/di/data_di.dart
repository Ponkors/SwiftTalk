import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/providers/remote/message_frbase_frstore_data_provider_impl.dart';
import 'package:data/repositories/auth_repository_impl.dart';
import 'package:data/repositories/contacts_repository_impl.dart';
import 'package:data/repositories/chat_repository_impl.dart';
import 'package:data/repositories/conversation_repository_impl.dart';
import 'package:data/repositories/message_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initFirebase();
    // await _initHiveDataBase(); //TODO вернуть для будущей даты.
    _initDataProvider();
    _initGoogleSignIn();
    _initAuthentication();
    _initContacts();
    _initChat();
    _initConversation();
  }

  Future<void> _initFirebase() async {
    getIt.registerLazySingleton<FirebaseFirestore>(
          () => FirebaseFirestore.instance,
    );
    getIt.registerLazySingleton<FirebaseAuth>(
          () => FirebaseAuth.instance,
    );
    FirebaseFirestore.instance.clearPersistence();
  }

  // Future<void> _initHiveDataBase() async {
  //   await Hive.initFlutter();
  //   getIt.registerLazySingleton<HiveProvider>(
  //         () => HiveProviderImpl(),
  //   );
  //   getIt.registerLazySingleton<UserEntityAdapter>(
  //         () => UserEntityAdapter(),
  //   );
  //   Hive.registerAdapter(
  //     getIt.get<UserEntityAdapter>(),
  //   );
  // }


  void _initDataProvider() {
    getIt.registerLazySingleton<FirebaseFirestoreDataProvider>(
          () => FirebaseFirestoreDataProviderImpl(
        firebaseFirestore: getIt.get<FirebaseFirestore>(),
      ),
    );
    getIt.registerLazySingleton<ChatFirebaseFirestoreDataProvider>(
        () => ChatFirebaseFirestoreDataProviderImpl(
          firebaseFirestore: getIt.get<FirebaseFirestore>(),
        ),
    );
  }

  Future<void> _initGoogleSignIn() async {
    getIt.registerLazySingleton<GoogleSignIn>(
          () => GoogleSignIn(),
    );
  }

  void _initAuthentication() {
    getIt.registerLazySingleton<FirebaseAuthProviderImpl>(
          () => FirebaseAuthProviderImpl(
        firebaseAuth: getIt.get<FirebaseAuth>(),
      ),
    );

    getIt.registerLazySingleton<AuthenticationRepository>(
          () => AuthenticationRepositoryImpl(
            firebaseAuthProviderImpl: getIt.get<FirebaseAuthProviderImpl>(),
      ),
    );
    getIt.registerLazySingleton<FirebaseAuthProvider>(
          () => FirebaseAuthProviderImpl(
        firebaseAuth: getIt.get<FirebaseAuth>(),
        // googleSignIn: getIt.get<GoogleSignIn>(),
        // firebaseFirestoreDataProvider: getIt.get<FirebaseFirestoreDataProvider>(),
        // hiveProvider: getIt.get<HiveProvider>(),
      ),
    );
    // getIt.registerLazySingleton<SignInUseCase>(
    //       () => SignInUseCase(
    //     authenticationRepository: getIt.get<AuthenticationRepository>(),
    //   ),
    // );
    // getIt.registerLazySingleton<SignUpUseCase>(
    //       () => SignUpUseCase(
    //     authenticationRepository: getIt.get<AuthenticationRepository>(),
    //   ),
    // );
    // getIt.registerLazySingleton<SignOutUseCase>(
    //       () => SignOutUseCase(
    //     authenticationRepository: getIt.get<AuthenticationRepository>(),
    //   ),
    // );
    // getIt.registerLazySingleton<SignInWithGoogleUseCase>(
    //       () => SignInWithGoogleUseCase(
    //     authRepository: getIt.get<AuthenticationRepository>(),
    //   ),
    // );
    // getIt.registerLazySingleton<ResetPasswordUseCase>(
    //       () => ResetPasswordUseCase(
    //     authenticationRepository: getIt.get<AuthenticationRepository>(),
    //   ),
    // );
    // getIt.registerLazySingleton<GetUserFromStorageUseCase>(
    //       () => GetUserFromStorageUseCase(
    //     authenticationRepository: getIt.get<AuthenticationRepository>(),
    //   ),
    // );
  }

  void _initContacts() {
    getIt.registerLazySingleton<ContactsRepository>(
        () => ContactsRepositoryImpl(
            firebaseFirestoreDataProvider: getIt.get<FirebaseFirestoreDataProvider>(),
            // hiveProvider: getIt.get<HiveProvider>(),
        ),
    );
  }

  void _initChat() {
    getIt.registerLazySingleton<ChatRepository>(
        () => ChatRepositoryImpl(
            firebaseFirestore: getIt.get<FirebaseFirestore>(),
            chatFirebaseFirestoreDataProvider: getIt.get<ChatFirebaseFirestoreDataProvider>(),
        ),
    );
  }

  void _initConversation() {
    getIt.registerLazySingleton<ConversationFirebaseFirestoreDataProviderImpl>(
          () => ConversationFirebaseFirestoreDataProviderImpl(
          firebaseFirestore: getIt.get<FirebaseFirestore>()
      ),
    );

    getIt.registerLazySingleton<ConversationRepository>(
        () => ConversationRepositoryImpl(
          firebaseFirestore: getIt.get<FirebaseFirestore>(),
          conversationFirebaseFirestoreDataProvider:
              getIt.get<ConversationFirebaseFirestoreDataProvider>(),
        ),
    );

    getIt.registerLazySingleton<ConversationFirebaseFirestoreDataProvider>(
        () => ConversationFirebaseFirestoreDataProviderImpl(
          firebaseFirestore: getIt.get<FirebaseFirestore>(),
        )
    );

    getIt.registerLazySingleton<MessageFirebaseFirestoreDataProviderImpl>(
        () => MessageFirebaseFirestoreDataProviderImpl(
          firebaseFirestore: getIt.get<FirebaseFirestore>(),
        ),
    );

    getIt.registerLazySingleton<MessageFirebaseFirestoreDataProvider>(
        () => MessageFirebaseFirestoreDataProviderImpl(
          firebaseFirestore: getIt.get<FirebaseFirestore>(),
        ),
    );

    getIt.registerLazySingleton<MessageRepository>(
        () =>  MessageRepositoryImpl(
          messageFirebaseFirestoreDataProvider:
              getIt.get<MessageFirebaseFirestoreDataProvider>(),
        ),
    );
  }
}