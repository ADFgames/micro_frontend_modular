import 'package:dependencies/dependencies.dart';
import 'package:login/app/module/domain/repositories/login_repository.dart';
import 'package:login/app/module/domain/usecases/usecases.dart';
import 'package:login/app/module/external/datasources/login_datasource_impl.dart';
import 'package:login/app/module/infra/datasources/login_datasource.dart';
import 'package:login/app/module/infra/repositories/login_repository_impl.dart';
import 'package:login/app/module/presenter/controller/login_page_controller.dart';
import 'package:login/app/module/presenter/login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<LoginUsecase>((i) => LoginUsecaseImpl(repository: i.get())),
    Bind.lazySingleton<LoginRepository>((i) => LoginRepositoryImpl(datasource: i.get())),
    Bind.lazySingleton<LoginDatasource>((i) => LoginDatasourceImpl(restClient: i.get())),
    Bind.lazySingleton<LoginPageController>((i) => LoginPageController(usecaseImpl: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const LoginPage()),
  ];
}
