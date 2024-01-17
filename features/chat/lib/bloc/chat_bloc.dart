import 'dart:developer';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository;

  ChatBloc({
    required this.chatRepository,
  }) : super(ChatInitial()) {
    on<ChatRequested>(_onChatRequestedToState);
  }

  Future<void> _onChatRequestedToState(
    ChatRequested event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(ChatLoadInProgress());
      final chats = await chatRepository.getChats(loginUID: event.loginUID);
      emit(ChatLoadSuccess(chats: chats));
    } on Exception catch (e, trace) {
      log('Trouble when loading chats $e $trace ');
      emit(const ChatLoadFailure(message: 'error to load chats'));
    }
  }
}