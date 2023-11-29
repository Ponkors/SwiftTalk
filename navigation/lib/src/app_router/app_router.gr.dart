// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    CheckAuthenticationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CheckAuthenticationScreen(),
      );
    },
    LogInRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LogInScreen(),
      );
    },
    ExampleRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ExampleScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'check_auth_screen',
          fullMatch: true,
        ),
        RouteConfig(
          CheckAuthenticationRoute.name,
          path: 'check_auth_screen',
        ),
        RouteConfig(
          LogInRoute.name,
          path: 'LogIn_screen',
        ),
        RouteConfig(
          ExampleRoute.name,
          path: 'example_screen',
        ),
      ];
}

/// generated route for
/// [CheckAuthenticationScreen]
class CheckAuthenticationRoute extends PageRouteInfo<void> {
  const CheckAuthenticationRoute()
      : super(
          CheckAuthenticationRoute.name,
          path: 'check_auth_screen',
        );

  static const String name = 'CheckAuthenticationRoute';
}

/// generated route for
/// [LogInScreen]
class LogInRoute extends PageRouteInfo<void> {
  const LogInRoute()
      : super(
          LogInRoute.name,
          path: 'LogIn_screen',
        );

  static const String name = 'LogInRoute';
}

/// generated route for
/// [ExampleScreen]
class ExampleRoute extends PageRouteInfo<void> {
  const ExampleRoute()
      : super(
          ExampleRoute.name,
          path: 'example_screen',
        );

  static const String name = 'ExampleRoute';
}
