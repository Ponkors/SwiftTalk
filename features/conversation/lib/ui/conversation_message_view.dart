import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:message/message.dart';

class ConversationMessageView extends StatelessWidget {
  final UserEntity loginUser;
  final UserEntity receiver;

  const ConversationMessageView({
    required this.loginUser,
    required this.receiver,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<MessageReceiverBloc, MessageReceiverState>(
        builder: (context, state) {
          if (state is MessageLoadInProgress) {
            return const CircularProgressIndicator();
          } else if (state is MessageLoadFailure) {
            return Text('Unable to load message: ${state.message}');
          } else if (state is MessageLoadSuccess) {
            return _MessageListBuilder(
              messages: state.messages,
              loginUID: loginUser.identifierId,
            );
          }
          return Text('Error ${state.runtimeType.toString()}');
        },
      ),
    );
  }
}

class _MessageListBuilder extends StatelessWidget {
  final String loginUID;
  final List<MessageModel?> messages;

  const _MessageListBuilder({
    required this.loginUID,
    required this.messages,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return messages.isEmpty
        ? Text('No Messages')
        : ListView.builder(
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              final message = messages.elementAt(index);
              return _MessageBody(
                message: message,
                isMine: message?.senderUID == loginUID,
              );
            },
            reverse: true,
    );
  }
}

class _MessageBody extends StatelessWidget {
  final MessageModel? message;
  final bool isMine;

  const _MessageBody({
    required this.message,
    required this.isMine,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isMine ? AppColors.blue: AppColors.grey,
        ),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context)
            .size.width * 0.7),
        child: Text(
          message?.content ?? '',
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}


