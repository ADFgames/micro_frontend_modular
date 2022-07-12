import 'package:dependencies/dependencies.dart';
import 'package:login/app/module/domain/usecases/usecases.dart';
import 'package:login/app/module/infra/models/models.dart';
import 'package:mobx/mobx.dart';
part 'login_page_controller.g.dart';

class LoginPageController = LoginPageControllerBase with _$LoginPageController;

abstract class LoginPageControllerBase with Store {
  final LoginUsecase usecaseImpl;

  LoginPageControllerBase({
    required this.usecaseImpl,
  });

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

  @observable
  ErrorLoginModel errorLoginModel = ErrorLoginModel(message: '', statusCode: 0);
  @action
  void setLoginInfoState(ErrorLoginModel newValue) => errorLoginModel = newValue;

  Future<void> auth(String email, String password) async {
    LoginParams params = LoginParams(email: email, password: password);

    final result = await usecaseImpl.auth(params);

    result.fold((loginFailure) {
      errorLoginModel.message = loginFailure.message;
      setLoginInfoState(errorLoginModel);
    }, (loginModel) {
      Modular.to.pushReplacementNamed('/home', arguments: loginModel);
    });
  }
}
