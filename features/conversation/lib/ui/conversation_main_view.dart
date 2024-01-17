import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:message/message.dart';
import 'package:conversation/ui/conversation_message_view.dart';
import 'package:conversation/ui/conversation_sender_view.dart';

class ConversationMainView extends StatelessWidget {
  final UserEntity loginUser;
  final UserEntity receiver;
  final String conversationId;

  const ConversationMainView({
    required this.loginUser,
    required this.receiver,
    required this.conversationId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height - 20,
          child: BlocProvider(
            create: (context) => MessageReceiverBloc(
              messageRepository: getIt.get<MessageRepository>(),
            )..add(MessageRequested(conversationId: conversationId)),
            child: ConversationMessageView(
              receiver: receiver,
              loginUser: loginUser,
            ),
          ),
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.all(5),
          child: BlocProvider(
            create: (context) => MessageSenderBloc(
              messageRepository: getIt.get<MessageRepository>(),
            ),
            child: ConversationSenderView(
              conversationId: conversationId,
              senderUID: loginUser.identifierId,
              receiverUID: receiver.identifierId,
            ),
          ),
        )
      ],
    );
  }
}
