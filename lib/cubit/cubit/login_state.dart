part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFalure extends LoginState {
  LoginFalure({required this.msg});
  final String msg;
}
class LoginLoading extends LoginState {}
