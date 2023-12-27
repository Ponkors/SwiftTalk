import 'package:contacts/bloc/contacts_bloc.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen();

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ContactsBloc>(context).add(ContactsListRequested());
    return BlocBuilder<ContactsBloc, ContactsState>(
        builder: (context, state) {
      if (state is ContactLoadInProgress) {
        return const Center(child: CupertinoActivityIndicator());
      } else if (state is ContactsLoadFailure) {
        return const Text('Unable to load contacts');
      } else if (state is ContactLoadSuccess) {
        return _contactListView(contacts: state.contacts);
      }
      return Text('${state.runtimeType}');
    },
    );
  }

  Widget _contactListView({required List<UserEntity> contacts}) {
    return ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          final contact = contacts.elementAt(index);
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.green,
              // backgroundImage: ,
            ),
            title: Text(contact.userName),
            subtitle: Text(contact.email),
          );
        }
    );
  }
}

