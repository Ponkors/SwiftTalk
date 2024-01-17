import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 170,
          color: Colors.red,
          child: Column(
            children: [
              Expanded(
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width > 600 ? 100 : 50,
        margin: const EdgeInsets.only(bottom: 15),
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
      ),
    );
  }
}
