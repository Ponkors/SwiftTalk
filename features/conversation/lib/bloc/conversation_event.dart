part of 'conversation_bloc.dart';

sealed class ConversationEvent extends Equatable {
  const ConversationEvent();

  @override
  List<Object> get props => [];
}

class ConversationDetailRequested extends ConversationEvent {
  final UserEntity loginUser;
  final UserEntity receiver;
  const ConversationDetailRequested({
    required this.loginUser,
    required this.receiver,
  });
}

class ConversationCreated extends ConversationEvent {
  final ConversationModel conversation;
  const ConversationCreated({
    required this.conversation,
  });
}
