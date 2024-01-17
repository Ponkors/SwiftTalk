part of 'router_bloc.dart';

sealed class RouterState extends Equatable {
  const RouterState();

  @override
  List<Object> get props => [];
}

class RouterContact extends RouterState {}

class RouterChat extends RouterState {}

class RouterMore extends RouterState {}
