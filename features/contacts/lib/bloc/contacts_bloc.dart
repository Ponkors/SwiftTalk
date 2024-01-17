import 'dart:async';
import 'dart:developer';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactsRepository contactsRepository;

  ContactsBloc({
    required this.contactsRepository,
  }) : super(ContactInitial()) {
    on<ContactsListRequested>(_onContactsListRequested);
  }

  FutureOr<void> _onContactsListRequested(
      ContactsListRequested event,
      Emitter<ContactsState> emit,
      ) async {
    try {
      emit(ContactLoadInProgress());
      final contacts =
        await contactsRepository.getContacts(loginUID: event.loginUID);
      emit(ContactLoadSuccess(contacts: contacts));
    } catch (e) {
      log('Error when loading contact ${e.toString()}');
      emit(const ContactsLoadFailure(message: 'Error while load contacts'));
    }
  }
}