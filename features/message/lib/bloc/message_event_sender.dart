part of 'message_bloc_sender.dart';

abstract class MessageSenderEvent extends Equatable {
  const MessageSenderEvent();

  @override
  List<Object> get props => [];
}

class MessageSent extends MessageSenderEvent {
  final MessageModel message;

  const MessageSent({
    required this.message,
  });
}
