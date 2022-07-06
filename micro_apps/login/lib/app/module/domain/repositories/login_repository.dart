import 'package:commons/commons.dart';
import 'package:dartz/dartz.dart';

import 'package:login/app/module/domain/entities/login_entity.dart';
import 'package:login/app/module/infra/models/models.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> auth(LoginParams loginParams);
}
