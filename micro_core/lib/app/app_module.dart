import 'package:commons/commons.dart';

import 'package:dependencies/dependencies.dart';
import 'package:home/home.dart';
import 'package:login/login.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<RestClient>((i) => DioRestClient()),
        Bind.lazySingleton(
          (i) => BaseOptions(
            baseUrl: apiDevBaseUrl,
            connectTimeout: 5000,
          ),
        ),
      ];

  @override
  List<Module> get imports => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
