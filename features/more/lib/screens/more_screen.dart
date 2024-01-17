import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:authentication/authentication.dart';
import 'package:more/ui/tab_widget.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
    BlocProvider.of<AuthenticationBloc>(context);
    return MaterialApp(
      title: 'Contacts Screen',
      home: Scaffold(
        body: Column(
          children: <Widget>[
            CategoryTabItem(titleText: 'Account'),
            CategoryTabItem(titleText: 'Chats'),
          ],
        ),
      ),
    );
  }
}
