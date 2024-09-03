part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignupEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const SignupEvent(this.name, this.email, this.password);

  @override
  List<Object> get props => [name, email, password];
}

class LogoutEvent extends AuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}