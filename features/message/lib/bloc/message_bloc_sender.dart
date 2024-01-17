import 'dart:async';
import 'dart:developer';
import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'message_event_sender.dart';
part 'message_state_sender.dart';

class MessageSenderBloc extends Bloc<MessageSenderEvent, MessageSenderState> {
  final MessageRepository messageRepository;

  MessageSenderBloc({
    required this.messageRepository,
  }) : super(MessageInitial()) {
    on<MessageSent>(_onMessageSentToState);
  }

  FutureOr<void> _onMessageSentToState(
      MessageSent event,
      Emitter<MessageSenderState> emit,
      ) async {
    try {
      emit(MessageSentInProgress());
      await messageRepository.sendMessage(message: event.message);
      emit(MessageSentSuccess());
    } on Exception catch (e, stackTrace) {
        log('Issue while sending message ${e.toString()} $stackTrace');
      emit(MessageSentFailure(message: e.toString()));
    }
  }
}
