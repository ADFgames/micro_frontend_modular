import 'package:commons/shared/rest_client/rest_client_errors_constants.dart';
import 'package:dependencies/dependencies.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final code = err.response?.data["code"];
    if (code == RestClientErrors.expiredTokenError) {
      // ignore: avoid_print
      print('Sessão Expirada');
    } else {
      handler.next(err);
    }
  }
}
