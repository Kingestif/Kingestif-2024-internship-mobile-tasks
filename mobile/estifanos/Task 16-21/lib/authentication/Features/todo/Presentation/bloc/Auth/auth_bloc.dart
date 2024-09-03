import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Domain/entity/Authentication.dart';
import '../../../Domain/usecase/logOut.dart';
import '../../../Domain/usecase/login.dart';
import '../../../Domain/usecase/signUp.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final signupUseCase signUpUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.signUpUseCase,
  }) : super(AuthInitialState()) {
    on<LoginEvent>(_loginEvent);
    on<SignupEvent>(_signUpEvent);
    on<LogoutEvent>(_logoutEvent);
  }


  Future<void> _loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoggingInState());

    final result = await loginUseCase(event.email, event.password);

    result.fold(
        (l) => emit(LogInFailure(l.message)),
        (r) => emit(const LoggedInState('Successfully logged in')),
    );
  }

  Future<void> _logoutEvent(LogoutEvent event, Emitter<AuthState> emit) async {
    try {
      //remove the token from sharedPreference
      final pref = await SharedPreferences.getInstance();
      pref.remove('Token');

      emit(const LoggedOutState('logged out Successfully'));
    } catch(error) {
      emit(const LogoutFailure('Logout failed'));
    }
  }

  Future<void> _signUpEvent(SignupEvent event, Emitter<AuthState> emit) async {
    emit(SigningUpState());
    final result = await signUpUseCase(event.name, event.email, event.password);

    print("SIGNUP BLOC");

    result.fold(
        (l) => emit(SignUpFailure(l.message)),
        (r) => emit(const SignedUpState('Successfully Signed up'))
    );
  }
  @override
  void onChange(Change<AuthState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print("current state: ${change.currentState}");
    print("next sate: ${change.nextState}");
  }

}

