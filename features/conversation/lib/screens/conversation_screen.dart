import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:conversation/conversation.dart';
import 'package:conversation/ui/conversation_main_view.dart';

class ConversationScreen extends StatelessWidget {
  final String? conversationId;
  final UserModel sender;
  final UserModel receiver;

  const ConversationScreen({
    this.conversationId,
    required this.sender,
    required this.receiver,
    Key? key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ConversationBloc>(context).add(ConversationDetailRequested(
      loginUser: sender,
      receiver: receiver,
    ));
    return ConversationView(
      loginUser: sender,
      receiver: receiver,
    );
  }
}

class ConversationView extends StatelessWidget {
  final UserModel loginUser;
  final UserModel receiver;

  const ConversationView({
    required this.loginUser,
    required this.receiver,
    Key? key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiver.userName),
        actions: [
          CircleAvatar(
            backgroundColor: AppColors.green,
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<ConversationBloc, ConversationState>(
          builder: (context, state) {
            if (state is ConversationLoadSuccess) {
              return ConversationMainView(
                loginUser: loginUser,
                receiver: receiver,
                conversationId: state.conversation.id ?? '',
              );
            } else if (state is ConversationCreationSuccess) {
              return ConversationMainView(
                loginUser: loginUser,
                receiver: receiver,
                conversationId: state.conversationId,
              );
            } else if (state is ConversationLoadInProgress ||
                state is ConversationCreationInProgress) {
              return const CircularProgressIndicator();
            } else if (state is ConversationLoadFailure ||
                state is ConversationCreationFailure) {
              return Text('Error while loading conversation');
            }
            return Text('${state.runtimeType} conversation_model.dart');
          },
        ),
      ),
    );
  }
}

