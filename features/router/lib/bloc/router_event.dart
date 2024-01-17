part of 'router_bloc.dart';

sealed class RouterEvent extends Equatable {
  const RouterEvent();

  @override
  List<Object> get props => [];
}

class RouterContactTapped extends RouterEvent {}

class RouterChatTapped extends RouterEvent {}

class RouterMoreTapped extends RouterEvent {}
