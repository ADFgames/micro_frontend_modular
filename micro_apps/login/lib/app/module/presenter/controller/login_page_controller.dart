import 'package:mobx/mobx.dart';

import '../../domain/usecases/usecases.dart';
import '../../infra/models/models.dart';
import '../states/states.dart';

part 'login_page_controller.g.dart';

class LoginPageController = LoginPageControllerBase with _$LoginPageController;

abstract class LoginPageControllerBase with Store {
  final LoginUsecase usecaseImpl;

  LoginPageControllerBase({
    required this.usecaseImpl,
  });

  @observable
  LoginState loginState = InitialLoginState();

  @action
  void setStateLogin(LoginState state) => loginState = state;

  @observable
  String email = "";

  @action
  void upadateEmail(String newValue) => email = newValue;

  @observable
  String password = "";

  @action
  void updatePassword(String newValue) => password = newValue;

  @observable
  bool obscuredText = false;

  @action
  void updateObscuredText(bool newValue) => obscuredText = newValue;

  Future<void> auth(String email, String password) async {
    setStateLogin(LoadingLoginState());

    LoginParams params = LoginParams(
      email: email,
      password: password,
    );

    final result = await usecaseImpl.auth(params);

    result.fold(
      (l) => setStateLogin(ErrorLoginState(l)),
      (r) => setStateLogin(SuccessLoginState(r)),
    );
  }
}
