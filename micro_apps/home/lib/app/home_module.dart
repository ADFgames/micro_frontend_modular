import 'package:dependencies/dependencies.dart';
import 'package:home/app/module/presenter/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => HomePage(model: args.data)),
      ];
}
