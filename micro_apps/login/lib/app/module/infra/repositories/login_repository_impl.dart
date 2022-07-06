import 'package:commons/commons.dart';
import 'package:dartz/dartz.dart';
import 'package:login/app/module/domain/entities/login_entity.dart';
import 'package:login/app/module/domain/repositories/login_repository.dart';
import 'package:login/app/module/infra/datasources/datasource.dart';
import 'package:login/app/module/infra/models/login_params.dart';

import '../../domain/errors/errors.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, LoginEntity>> auth(LoginParams loginParams) async {
    try {
      final result = await datasource.auth(loginParams);
      return Right(result);
    } on RestClientException catch (e) {
      final code = e.response?.data['code'];
      final message = e.response?.data['message'];

      if (code == RestClientErrors.internalServerError) return Left(InternalServerError(message: message));
      if (code == RestClientErrors.expiredTokenError) return Left(ExpiredTokenError(message: message));
      if (code == RestClientErrors.unauthorizedError) return Left(UnauthorizedError(message: message));

      if (code == 1) return Left(InvalidDataErrorLogin(message: message));
      if (code == 400) return Left(BadRequest(message: message));

      rethrow;
    }
  }
}
