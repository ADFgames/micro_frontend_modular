// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginPageController on LoginPageControllerBase, Store {
  late final _$loginStateAtom =
      Atom(name: 'LoginPageControllerBase.loginState', context: context);

  @override
  LoginState get loginState {
    _$loginStateAtom.reportRead();
    return super.loginState;
  }

  @override
  set loginState(LoginState value) {
    _$loginStateAtom.reportWrite(value, super.loginState, () {
      super.loginState = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'LoginPageControllerBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'LoginPageControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$obscuredTextAtom =
      Atom(name: 'LoginPageControllerBase.obscuredText', context: context);

  @override
  bool get obscuredText {
    _$obscuredTextAtom.reportRead();
    return super.obscuredText;
  }

  @override
  set obscuredText(bool value) {
    _$obscuredTextAtom.reportWrite(value, super.obscuredText, () {
      super.obscuredText = value;
    });
  }

  late final _$LoginPageControllerBaseActionController =
      ActionController(name: 'LoginPageControllerBase', context: context);

  @override
  void setStateLogin(LoginState state) {
    final _$actionInfo = _$LoginPageControllerBaseActionController.startAction(
        name: 'LoginPageControllerBase.setStateLogin');
    try {
      return super.setStateLogin(state);
    } finally {
      _$LoginPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void upadateEmail(String newValue) {
    final _$actionInfo = _$LoginPageControllerBaseActionController.startAction(
        name: 'LoginPageControllerBase.upadateEmail');
    try {
      return super.upadateEmail(newValue);
    } finally {
      _$LoginPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePassword(String newValue) {
    final _$actionInfo = _$LoginPageControllerBaseActionController.startAction(
        name: 'LoginPageControllerBase.updatePassword');
    try {
      return super.updatePassword(newValue);
    } finally {
      _$LoginPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateObscuredText(bool newValue) {
    final _$actionInfo = _$LoginPageControllerBaseActionController.startAction(
        name: 'LoginPageControllerBase.updateObscuredText');
    try {
      return super.updateObscuredText(newValue);
    } finally {
      _$LoginPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loginState: ${loginState},
email: ${email},
password: ${password},
obscuredText: ${obscuredText}
    ''';
  }
}
