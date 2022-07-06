import 'package:commons/commons.dart';
import 'package:login/app/module/domain/errors/errors_login.dart';
import 'package:login/app/module/infra/datasources/login_datasource.dart';
import 'package:login/app/module/infra/models/login_model.dart';
import 'package:login/app/module/infra/models/login_params.dart';

class LoginDatasourceImpl implements LoginDatasource {
  RestClient restClient;

  LoginDatasourceImpl({
    required this.restClient,
  });

  @override
  Future<LoginModel> auth(LoginParams loginParams) async {
    RestClientResponse restClientResponse = await restClient.post('/login', data: loginParams.toJson());

    Map<String, dynamic> respData = restClientResponse.data;

    if (restClientResponse.statusCode == 200) {
      return LoginModel.fromMap(respData);
    }
    throw DataSourceErrorLogin(
      message: respData['message'],
      statusCode: respData['code'],
    );
  }
}
