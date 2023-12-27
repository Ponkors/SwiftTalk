part of 'message_bloc_receiver.dart';

abstract class MessageReceiverEvent extends Equatable {
  const MessageReceiverEvent();

  @override
  List<Object> get props => [];
}

class MessageRequested extends MessageReceiverEvent {
  final String conversationId;
  const MessageRequested({
    required this.conversationId,
  });
}

class MessageReceived extends MessageReceiverEvent {
  final List<MessageModel?> messages;
  const MessageReceived({
    required this.messages,
  });
}
