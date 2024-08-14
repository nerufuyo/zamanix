part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class SignUpWithEmailAndPassword extends AuthenticationEvent {
  final String fullname;
  final String email;
  final String password;

  const SignUpWithEmailAndPassword({
    required this.fullname,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [fullname, email, password];
}

final class SignInWithEmailAndPassword extends AuthenticationEvent {
  final String email;
  final String password;

  const SignInWithEmailAndPassword({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

final class SignOut extends AuthenticationEvent {}

final class CheckAuthentication extends AuthenticationEvent {}
