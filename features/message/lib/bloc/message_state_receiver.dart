part of 'message_bloc_receiver.dart';

abstract class MessageReceiverState extends Equatable {
  const MessageReceiverState();

  @override
  List<Object> get props => [];
}

class MessageReceiverInitial extends MessageReceiverState {}

class MessageLoadSuccess extends MessageReceiverState {
  final List<MessageModel?> messages;

  const MessageLoadSuccess({required this.messages});

  @override
  List<Object> get props => [messages];
}

class MessageLoadInProgress extends MessageReceiverState {}

class MessageLoadFailure extends MessageReceiverState {
  final String message;

  const MessageLoadFailure({required this.message});
}
