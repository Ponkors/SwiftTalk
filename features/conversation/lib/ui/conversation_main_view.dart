import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:message/message.dart';
import 'package:conversation/ui/conversation_message_view.dart';
import 'package:conversation/ui/conversation_sender_view.dart';

class ConversationMainView extends StatelessWidget {
  final UserModel loginUser;
  final UserModel receiver;
  final String conversationId;


  const ConversationMainView({
    required this.loginUser,
    required this.receiver,
    required this.conversationId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MessageReceiverBloc>(context).add(MessageRequested(
      conversationId: conversationId,
    ));
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height - 50 - 20,
          child: ConversationMessageView(
            receiver: receiver,
            loginUser: loginUser,
          ),
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.all(5),
          child: ConversationSenderView(
            senderUID: loginUser.identifierId,
            receiverUID: receiver.identifierId,
            conversationId: conversationId,
          ),
        )
      ],
    );
  }
}
