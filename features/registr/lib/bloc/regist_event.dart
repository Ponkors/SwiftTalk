// part of 'regist_bloc.dart';
//
// sealed class RegistrationEvent extends Equatable {
//   const RegistrationEvent();
//
//   @override
//   List<Object> get props => [];
// }
//
// class RegistrationDetailRequested extends RegistrationEvent {
//   final String identifierId;
//   const RegistrationDetailRequested({
//     required this.identifierId
//   });
//
//   @override
//   List<Object> get props => [identifierId];
// }
//
// class RegistrationDetailUpdated extends RegistrationEvent {
//   final UserModel user;
//   const RegistrationDetailUpdated({
//     required this.user,
//   });
//
//   @override
//   List<Object> get props => [user];
// }