import 'package:login/app/module/infra/models/models.dart';

abstract class LoginDatasource {
  Future<LoginModel> auth(LoginParams loginParams);
}
