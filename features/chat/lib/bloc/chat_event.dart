part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatRequested extends ChatEvent {
  final String loginUID;

  const ChatRequested({
    required this.loginUID,
  });

  @override
  List<Object> get props => [loginUID];
}