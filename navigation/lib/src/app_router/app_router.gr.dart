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
    RoutingLogicRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RoutingLogicScreen(),
      );
    },
    ContactsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ContactsScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ChatScreen(),
      );
    },
    MoreRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MoreScreen(),
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
          RoutingLogicRoute.name,
          path: 'routing_logic',
          children: [
            RouteConfig(
              ContactsRoute.name,
              path: 'contacts_screen',
              parent: RoutingLogicRoute.name,
            ),
            RouteConfig(
              ChatRoute.name,
              path: 'chat_screen',
              parent: RoutingLogicRoute.name,
            ),
            RouteConfig(
              MoreRoute.name,
              path: 'more_screen',
              parent: RoutingLogicRoute.name,
            ),
          ],
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
/// [RoutingLogicScreen]
class RoutingLogicRoute extends PageRouteInfo<void> {
  const RoutingLogicRoute({List<PageRouteInfo>? children})
      : super(
          RoutingLogicRoute.name,
          path: 'routing_logic',
          initialChildren: children,
        );

  static const String name = 'RoutingLogicRoute';
}

/// generated route for
/// [ContactsScreen]
class ContactsRoute extends PageRouteInfo<void> {
  const ContactsRoute()
      : super(
          ContactsRoute.name,
          path: 'contacts_screen',
        );

  static const String name = 'ContactsRoute';
}

/// generated route for
/// [ChatScreen]
class ChatRoute extends PageRouteInfo<void> {
  const ChatRoute()
      : super(
          ChatRoute.name,
          path: 'chat_screen',
        );

  static const String name = 'ChatRoute';
}

/// generated route for
/// [MoreScreen]
class MoreRoute extends PageRouteInfo<void> {
  const MoreRoute()
      : super(
          MoreRoute.name,
          path: 'more_screen',
        );

  static const String name = 'MoreRoute';
}
