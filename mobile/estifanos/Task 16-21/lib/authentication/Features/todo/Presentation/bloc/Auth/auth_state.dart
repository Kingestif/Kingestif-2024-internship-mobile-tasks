part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

// ----------login
class LoggingInState extends AuthState {
  const LoggingInState();

  @override
  List<Object?> get props => [];
}

class LoggedInState extends AuthState {
  final String message;

  const LoggedInState(this.message);

  @override
  List<Object?> get props => [message];
}

class LogInFailure extends AuthState {
  final String message;

  const LogInFailure(this.message);

  @override
  List<Object?> get props => [message];
}

// -------------signup

class SigningUpState extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignedUpState extends AuthState {
  final String message;

  const SignedUpState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class SignUpFailure extends AuthState {
  final String message;
  const SignUpFailure(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];

}


// -------------------logout
class LoggedOutState extends AuthState {
  final String message;

  const LoggedOutState(this.message);

  @override
  List<Object?> get props => [message];
}

class LogoutFailure extends AuthState {
  final String message;

  const LogoutFailure(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}