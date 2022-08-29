import 'package:commons/commons.dart';
import 'package:login/app/module/domain/entities/entities.dart';

abstract class LoginState {}

class InitialLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  final LoginEntity login;

  SuccessLoginState(this.login);
}

class ErrorLoginState extends LoginState {
  final Failure error;

  ErrorLoginState(this.error);
}

class LoadingLoginState extends LoginState {}
