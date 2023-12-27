import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:message/message.dart';

class ConversationSenderView extends StatefulWidget {

  final String? conversationId;
  final String senderUID;
  final String receiverUID;

  const ConversationSenderView({
    this.conversationId,
    required this.senderUID,
    required this.receiverUID,
    Key? key,
  }) : super(key: key);

  @override
  State<ConversationSenderView> createState() => _ConversationSenderViewState();
}

class _ConversationSenderViewState extends State<ConversationSenderView> {
  late final TextEditingController messageTextController;
  late String message;

  @override
  void initState() {
    super.initState();
    messageTextController = TextEditingController();
  }

  @override
  void dispose() {
    messageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 9,
          child: TextField(
            controller: messageTextController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Expanded(
          child: BlocConsumer<MessageSenderBloc, MessageSenderState>(
            listener: (context, state) {
              if (state is MessageSentSuccess) {
                setState(messageTextController.clear);
              }
            },
            builder: (context, state) {
              if (state is MessageSentInProgress) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MessageSentFailure) {
                return const Icon(Icons.error);
              }
              return IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  message = messageTextController.text.trim();
                  if (message.isNotEmpty) {
                    BlocProvider.of<MessageSenderBloc>(context).add(
                      MessageSent(
                        message: MessageModel(
                          senderUID: widget.senderUID,
                          receiverUID: widget.receiverUID,
                          content: message,
                          conversationId: widget.conversationId ?? '',
                          timeStamp:
                            DateTime.now().millisecondsSinceEpoch.toString(),
                        ),
                      ),
                    );
                  }
                },
              );
            },
          )
        )
      ],
    );
  }
}

