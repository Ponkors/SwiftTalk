part of 'message_bloc_sender.dart';

abstract class MessageSenderState extends Equatable {
  const MessageSenderState();

  @override
  List<Object> get props => [];
}

class MessageInitial extends MessageSenderState {}

class MessageSentSuccess extends MessageSenderState {}

class MessageSentFailure extends MessageSenderState {
  final String message;

  const MessageSentFailure({
    required this.message,
  });
}

class MessageSentInProgress extends MessageSenderState {}
