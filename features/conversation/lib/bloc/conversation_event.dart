part of 'conversation_bloc.dart';

abstract class ConversationEvent extends Equatable {
  const ConversationEvent();

  @override
  List<Object> get props => [];
}

class ConversationDetailRequested extends ConversationEvent {
  final UserModel loginUser;
  final UserModel receiver;
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
