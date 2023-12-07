import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:authentication/authentication.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  bool isSearching = false;
  TextEditingController searchUserNameController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    return MaterialApp(
      title: 'Contacts Screen',
      home: Scaffold(
        body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return Container(
              alignment: Alignment.center,
              child: Text('Placeholder'),
            );
          },
        )
      ),
    );
  }
}
