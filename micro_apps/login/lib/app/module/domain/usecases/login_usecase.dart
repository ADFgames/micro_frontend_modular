import 'package:commons/commons.dart';
import 'package:dartz/dartz.dart';
import 'package:login/app/module/domain/entities/login_entity.dart';
import 'package:login/app/module/domain/errors/errors.dart';
import 'package:login/app/module/domain/repositories/login_repository.dart';
import 'package:login/app/module/infra/models/models.dart';

abstract class LoginUsecase {
  Future<Either<Failure, LoginEntity>> auth(LoginParams loginParams);
}

class LoginUsecaseImpl extends LoginUsecase {
  final LoginRepository repository;

  LoginUsecaseImpl({required this.repository});

  @override
  Future<Either<Failure, LoginEntity>> auth(LoginParams loginParams) async {
    if (loginParams.email.isEmpty || loginParams.password.isEmpty) {
      return Left(
        InvalidDataErrorLogin(
          message: 'Parâmetros de autenticação inválidos!',
          statusCode: 0,
        ),
      );
    }
    return await repository.auth(loginParams);
  }
}
