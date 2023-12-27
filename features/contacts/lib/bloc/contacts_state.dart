part of 'contacts_bloc.dart';

abstract class ContactsState extends Equatable {
  const ContactsState();

  @override
  List<Object> get props => [];
}

class ContactInitial extends ContactsState{}

class ContactLoadInProgress extends ContactsState{}

class ContactLoadSuccess extends ContactsState{
  final List<UserEntity> contacts;
  const ContactLoadSuccess({required this.contacts});
}

class ContactsLoadFailure extends ContactsState {
  final String message;
  const ContactsLoadFailure({
    required this.message,
  });
}

