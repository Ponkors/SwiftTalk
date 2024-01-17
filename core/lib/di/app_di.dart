import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

final AppDI appDi = AppDI();

class AppDI {
  void initDependencies() {
    // _setupNavigationDependencies();
  }

  // TODO временно отключил auto_route и пробовал переходить между экранами
  // с помошью встроенной навигации, для того чтобы проверить передачу инфы
  // между виджетами.

  // void _setupNavigationDependencies() {
  //   getIt.registerSingleton<AppRouter>(
  //     AppRouter(),
  //   );
  // }
}
