import 'package:domain/domain.dart';
import 'package:data/data.dart';


class GetAllContactsUseCase {
  final ContactsRepository _usersRepository;

  GetAllContactsUseCase(this._usersRepository);

  Future<List<UserEntity>> execute() async {
    return await _usersRepository.getContacts();
  }
}