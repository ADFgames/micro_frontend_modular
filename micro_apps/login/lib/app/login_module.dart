import 'package:commons/shared/rest_client/rest_client.dart';
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
  List<Bind> get binds => [
        Bind.singleton<LoginPageController>((i) => LoginPageController(usecaseImpl: i.get<LoginUsecaseImpl>())),
        Bind.lazySingleton<LoginUsecase>((i) => LoginUsecaseImpl(repository: i.get<LoginRepositoryImpl>())),
        Bind.lazySingleton<LoginRepository>((i) => LoginRepositoryImpl(datasource: i.get<LoginDatasourceImpl>())),
        Bind.lazySingleton<LoginDatasource>((i) => LoginDatasourceImpl(restClient: i.get<RestClient>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const LoginPage()),
      ];
}
