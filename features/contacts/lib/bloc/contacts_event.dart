part of 'contacts_bloc.dart';

abstract class ContactsEvent {
  const ContactsEvent();

  @override
  List<Object> get props => [];
}


class ContactsListRequested extends ContactsEvent {
  // final String email;
  const ContactsListRequested();
}