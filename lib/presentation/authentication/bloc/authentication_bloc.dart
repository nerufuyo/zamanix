import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zamanix/repositories/authentication_repository.dart';
import 'package:zamanix/repositories/models/user_model.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationBloc(this._authenticationRepository)
      : super(AuthenticationInitial()) {
    // Sign up with email and password
    on<SignUpWithEmailAndPassword>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        final user = await _authenticationRepository.signUpWithEmailAndPassword(
          event.fullname,
          event.email,
          event.password,
        );
        emit(AuthenticationSuccess(user: user));
      } catch (e) {
        emit(AuthenticationFailure(error: e.toString()));
      }
    });

    // Sign in with email and password
    on<SignInWithEmailAndPassword>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        final user = await _authenticationRepository.signInWithEmailAndPassword(
          event.email,
          event.password,
        );
        emit(AuthenticationSuccess(user: user));
      } catch (e) {
        emit(AuthenticationFailure(error: e.toString()));
      }
    });

    // Sign out
    on<SignOut>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        await _authenticationRepository.signOut();
        emit(AuthenticationInitial());
      } catch (e) {
        emit(AuthenticationFailure(error: e.toString()));
      }
    });

    // Check authentication
    on<CheckAuthentication>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        final isSignedIn = await _authenticationRepository.isSignedIn();
        if (isSignedIn) {
          final user = await _authenticationRepository.getUser();
          emit(AuthenticationSuccess(user: user));
        } else {
          emit(AuthenticationInitial());
        }
      } catch (e) {
        emit(AuthenticationFailure(error: e.toString()));
      }
    });
  }
}
