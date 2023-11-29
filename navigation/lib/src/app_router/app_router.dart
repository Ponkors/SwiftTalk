import 'package:authentication/authentication.dart';
import 'package:example/example.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    // AutoRoute(page: WalkthroughScreen, path: 'walkthrough_screen', initial: true),
    AutoRoute(page: CheckAuthenticationScreen, path: 'check_auth_screen', initial: true),
    AutoRoute(page: LogInScreen, path: 'LogIn_screen'),
    AutoRoute(page: ExampleScreen, path: 'example_screen'),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
