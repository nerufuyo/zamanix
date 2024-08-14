import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zamanix/repositories/models/user_model.dart';
import 'package:zamanix/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserInitial()) {
    on<GetUser>(_onGetUser);
    on<UpdateUser>(_onUpdateUser);
    on<DeleteUser>(_onDeleteUser);
  }

  Future<void> _onGetUser(GetUser event, Emitter<UserState> emit) async {
    emit(UserLoading());

    try {
      final UserModel userModel = await _userRepository.getUser();
      emit(UserSuccess(userModel));
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }

  Future<void> _onUpdateUser(UpdateUser event, Emitter<UserState> emit) async {
    emit(UserLoading());

    try {
      final UserModel userModel =
          await _userRepository.updateUser(event.userModel);
      emit(UserSuccess(userModel));
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }

  Future<void> _onDeleteUser(DeleteUser event, Emitter<UserState> emit) async {
    emit(UserLoading());

    try {
      final UserModel userModel =
          await _userRepository.deleteUser(event.userModel);
      emit(UserSuccess(userModel));
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }
}
