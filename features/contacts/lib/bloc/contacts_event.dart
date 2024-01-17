part of 'contacts_bloc.dart';

sealed class ContactsEvent {
  const ContactsEvent();

  @override
  List<Object> get props => [];
}

class ContactsListRequested extends ContactsEvent {
  final String loginUID;
  const ContactsListRequested({
    required this.loginUID,
  });
}
