import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:router/router.dart';
import 'package:contacts/contacts.dart';
import 'package:chat/chat.dart';
import 'package:more/more.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    // AutoRoute(page: WalkthroughScreen, path: 'walkthrough_screen', initial: true),
    AutoRoute(page: CheckAuthenticationScreen, path: 'check_auth_screen', initial: true),
    AutoRoute(page: LogInScreen, path: 'LogIn_screen'),
    AutoRoute(page: RoutingLogicScreen, path: 'routing_logic', children: [
      AutoRoute(page: ContactsScreen, path: 'contacts_screen'),
      AutoRoute(page: ChatScreen, path: 'chat_screen'),
      AutoRoute(page: MoreScreen, path: 'more_screen'),
      ],
    ),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
