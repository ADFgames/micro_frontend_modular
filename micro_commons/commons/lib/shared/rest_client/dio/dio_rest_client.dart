import 'package:commons/shared/rest_client/dio/interceptors/auth_interceptor.dart';
import 'package:commons/shared/rest_client/rest_client.dart';
import 'package:commons/shared/rest_client/rest_client_exception.dart';
import 'package:commons/shared/rest_client/rest_client_response.dart';
import 'package:commons/shared/utils/consts.dart';
import 'package:dependencies/dependencies.dart';

class DioRestClient implements RestClient {
  Dio? _dio;

  final BaseOptions _defaultBaseOptions = BaseOptions(
    baseUrl: const String.fromEnvironment("API_BASE_URL", defaultValue: apiDevBaseUrl),
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  DioRestClient({BaseOptions? options}) {
    _dio = Dio(options ?? _defaultBaseOptions);
    _dio?.interceptors.addAll([
      LogInterceptor(),
      AuthInterceptor(),
    ]);
  }

  @override
  RestClient auth() {
    _defaultBaseOptions.extra['auth_required'] = true;
    return this;
  }

  @override
  RestClient unuth() {
    _defaultBaseOptions.extra['auth_required'] = false;
    return this;
  }

  RestClientResponse? _dioErrorResponseConverter(Response? response) {
    return RestClientResponse(
      data: response?.data,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
    );
  }

  RestClientResponse<T> _dioResponseConverter<T>(Response response) {
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path,
      {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio?.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter<T>(response!);
    } on DioError catch (e) {
      throw RestClientException(
        error: e.response?.statusMessage,
        statusCode: e.response?.statusCode,
        message: e.response?.statusMessage,
        response: _dioErrorResponseConverter(e.response),
      );
    }
  }

  @override
  Future<RestClientResponse<T>> delete<T>(String path,
      {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    throw UnimplementedError();
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    throw UnimplementedError();
  }

  @override
  Future<RestClientResponse<T>> patch<T>(String path,
      {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    throw UnimplementedError();
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path,
      {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    throw UnimplementedError();
  }

  @override
  Future<RestClientResponse<T>> request<T>(String path,
      {data, required String method, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    throw UnimplementedError();
  }
}
