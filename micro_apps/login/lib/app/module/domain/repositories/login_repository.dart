import 'package:commons/commons.dart';
import 'package:dependencies/dependencies.dart';
import 'package:login/app/module/domain/entities/login_entity.dart';
import 'package:login/app/module/infra/models/models.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> auth(LoginParams params);
}
