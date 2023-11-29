import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

final AppDI appDi = AppDI();

class AppDI {
  void initDependencies() {
    _setupNavigationDependencies();
  }

  void _setupNavigationDependencies() {
    getIt.registerSingleton<AppRouter>(
      AppRouter(),
    );
  }
}
