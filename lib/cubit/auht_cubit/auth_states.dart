abstract class AuthStates {}

class initialState extends AuthStates {}

class LoginFailedState extends AuthStates {
  String msg;
  LoginFailedState({required this.msg});
}

class LoginSuscessState extends AuthStates {}

class LoadingState extends AuthStates {}
