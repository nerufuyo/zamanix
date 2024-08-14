part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

final class GetUser extends UserEvent {}

final class UpdateUser extends UserEvent {
  final UserModel userModel;

  const UpdateUser(this.userModel);

  @override
  List<Object> get props => [userModel];
}

final class DeleteUser extends UserEvent {
  final UserModel userModel;

  const DeleteUser(this.userModel);

  @override
  List<Object> get props => [userModel];
}
