import 'dart:async';
import 'dart:developer';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  final ConversationRepository conversationRepository;
  ConversationBloc({
    required this.conversationRepository,
  }) : super(ConversationInitial()) {
    on<ConversationDetailRequested>(_onConversationDetailRequested);
    on<ConversationCreated>(_onConversationCreated);
  }

  FutureOr<void> _onConversationDetailRequested(
      ConversationDetailRequested event,
      Emitter<ConversationState> emit,
      ) async {
    try {
      emit(ConversationLoadInProgress());
      final conversationDetail = await conversationRepository.getConversation(
        senderUID: event.loginUser.identifierId,
        receiverUID: event.receiver.identifierId,
      );

      if (conversationDetail != null) {
        emit(ConversationLoadSuccess(conversation: conversationDetail));
      } else {
        add(
          ConversationCreated(
            conversation: ConversationModel(
              creator: event.loginUser,
              receiver: event.receiver,
              members: [
                event.loginUser.identifierId,
                event.receiver.identifierId,
              ],
            ),
          ),
        );
      }
    } catch (e, stackTrace) {
      log('Issue while fetching conversation detail ${e.toString()}');
      log('Stack trace is ${stackTrace.toString()}');
      emit(
        const ConversationLoadFailure(message: 'Unable to load Conversation'),
      );
    }
  }

  FutureOr<void> _onConversationCreated(
      ConversationCreated event,
      Emitter<ConversationState> emit,
      ) async {
    try {
      emit(ConversationCreationInProgress());

      final conversationId = await conversationRepository.createConversation(
        conversation: event.conversation,
      );
      emit(ConversationCreationSuccess(conversationId: conversationId));
    } catch (e) {
      log('Issue occured while creating conversation ${e.toString()}');
      emit(
        ConversationCreationFailure(
          message: 'Unable to create new conversation ${e.toString()}',
        ),
      );
    }
  }
}
