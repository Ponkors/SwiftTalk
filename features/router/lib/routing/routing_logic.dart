import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:authentication/authentication.dart';
import 'package:contacts/contacts.dart';
import 'package:chat/chat.dart';

class RoutingLogicScreen extends StatelessWidget {
  const RoutingLogicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc = BlocProvider.of(context);
    final UserModel authenticatedUser;
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<AuthenticationBloc>(
          create: (_) => AuthenticationBloc(
              signInUseCase: getIt.get<SignInUseCase>(),
              signUpUseCase: getIt.get<SignUpUseCase>(),
              signOutUseCase: getIt.get<SignOutUseCase>(),
              signInWithGoogleUseCase: getIt.get<SignInWithGoogleUseCase>(),
              resetPasswordUseCase: getIt.get<ResetPasswordUseCase>(),
              getUserFromStorageUseCase: getIt.get<GetUserFromStorageUseCase>(),
              appRouter: getIt.get<AppRouter>(),
          ),
        ),
        BlocProvider<ContactsBloc>(
            create: (_) => ContactsBloc(
              contactsRepository: getIt.get<ContactsRepository>(),
            ),
        ),
        BlocProvider<ChatBloc>(
          create: (_) => ChatBloc(
            chatRepository: getIt.get<ChatRepository>(),
          ),
        )
      ],
      child: AutoTabsScaffold(
        animationCurve: Curves.linear,
        animationDuration: const Duration(
          milliseconds: 250,
        ),
        routes: const <PageRouteInfo<dynamic>>[
          ContactsRoute(),
          ChatRoute(),
          MoreRoute(),
        ],
        builder: (_, Widget? child, Animation<double> animation) {
          return SlideTransition(
            position: animation.drive(
              Tween<Offset>(
                begin: const Offset(0, 1),
                end: const Offset(0, 0),
              ),
            ),
            child: child,
          );
        },
        appBarBuilder: (_, TabsRouter tabsRouter) {
          return CustomAppBar(
            currentIndex: tabsRouter.activeIndex,
            onIconPressed: () {
              authenticationBloc.add(SignOutSubmitted());
              authenticationBloc.add(NavigateToSignInScreen());
            },
          );
        },
        bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
          return CustomBottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
          );
        },
      ),
    );
  }
}


