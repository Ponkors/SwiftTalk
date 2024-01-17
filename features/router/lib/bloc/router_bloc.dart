import 'dart:async';
import 'package:core/core.dart';

part 'router_event.dart';
part 'router_state.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc() : super(RouterContact()) {
    on<RouterContactTapped>(_onContactTapped);
    on<RouterChatTapped>(_onChatTapped);
    on<RouterMoreTapped>(_onMoreTapped);
  }

  FutureOr<void> _onContactTapped(
    RouterContactTapped event,
    Emitter<RouterState> emit,
      ) {
    emit(RouterContact());
  }

  FutureOr<void> _onChatTapped(
    RouterChatTapped event,
    Emitter<RouterState> state,
      ) {
    emit(RouterChat());
  }

  FutureOr<void> _onMoreTapped(
      RouterMoreTapped event,
      Emitter<RouterState> state,
      ) {
    emit(RouterMore());
  }
}