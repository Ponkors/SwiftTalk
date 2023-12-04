import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/repositories/auth_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initFirebase();
    await _initHiveDataBase();
    _initDataProvider();
    _initGoogleSignIn();
    _initAuthentication();

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

  Future<void> _initHiveDataBase() async {
    await Hive.initFlutter();
    getIt.registerLazySingleton<HiveProvider>(
          () => HiveProviderImpl(),
    );
    getIt.registerLazySingleton<UserEntityAdapter>(
          () => UserEntityAdapter(),
    );
    Hive.registerAdapter(
      getIt.get<UserEntityAdapter>(),
    );
  }


  void _initDataProvider() {
    getIt.registerLazySingleton<FirebaseFirestoreDataProvider>(
          () => FirebaseFirestoreDataProviderImpl(
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
    getIt.registerLazySingleton<AuthenticationRepository>(
          () => AuthenticationRepositoryImpl(
        firebaseAuthProvider: getIt.get<FirebaseAuthProvider>(),
        hiveProvider: getIt.get<HiveProvider>(),
      ),
    );
    getIt.registerLazySingleton<FirebaseAuthProvider>(
          () => FirebaseAuthProviderImpl(
        firebaseAuth: getIt.get<FirebaseAuth>(),
        googleSignIn: getIt.get<GoogleSignIn>(),
        firebaseFirestoreDataProvider: getIt.get<FirebaseFirestoreDataProvider>(),
        hiveProvider: getIt.get<HiveProvider>(),
      ),
    );
    getIt.registerLazySingleton<SignInUseCase>(
          () => SignInUseCase(
        authenticationRepository: getIt.get<AuthenticationRepository>(),
      ),
    );
    getIt.registerLazySingleton<SignUpUseCase>(
          () => SignUpUseCase(
        authenticationRepository: getIt.get<AuthenticationRepository>(),
      ),
    );
    getIt.registerLazySingleton<SignOutUseCase>(
          () => SignOutUseCase(
        authenticationRepository: getIt.get<AuthenticationRepository>(),
      ),
    );
    getIt.registerLazySingleton<SignInWithGoogleUseCase>(
          () => SignInWithGoogleUseCase(
        authRepository: getIt.get<AuthenticationRepository>(),
      ),
    );
    getIt.registerLazySingleton<ResetPasswordUseCase>(
          () => ResetPasswordUseCase(
        authenticationRepository: getIt.get<AuthenticationRepository>(),
      ),
    );
    getIt.registerLazySingleton<GetUserFromStorageUseCase>(
          () => GetUserFromStorageUseCase(
        authenticationRepository: getIt.get<AuthenticationRepository>(),
      ),
    );
  }
}