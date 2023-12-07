import 'package:domain/domain.dart';

class GetUserFromStorageUseCase implements FutureUseCase<NoParams,UserModel>{
  final AuthenticationRepository _authenticationRepository;

  GetUserFromStorageUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<UserModel> execute(NoParams input) async {
    return _authenticationRepository.getUserFromStorage();
  }
}