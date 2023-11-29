import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';
import 'package:authentication/authentication.dart';

class SwiftTalkApp extends StatelessWidget {
  const SwiftTalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<AuthenticationBloc>(
          create: (_) => AuthenticationBloc(
            signInUseCase: getIt.get<SignInUseCase>(),
            signUpUseCase: getIt.get<SignUpUseCase>(),
            signOutUseCase: getIt.get<SignOutUseCase>(),
            resetPasswordUseCase: getIt.get<ResetPasswordUseCase>(),
            getUserFromStorageUseCase: getIt.get<GetUserFromStorageUseCase>(),
            appRouter: getIt.get<AppRouter>(),
          )..add(InitAuthentication()),
        ),
      ],
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
          return MaterialApp.router(
            builder: (BuildContext context, Widget? child) {
              final MediaQueryData mediaQueryData = MediaQuery.of(context);
              return MediaQuery(
                data: mediaQueryData.copyWith(),
                child: child!,
              );
            },
            routerDelegate: getIt.get<AppRouter>().delegate(),
            routeInformationParser: getIt.get<AppRouter>().defaultRouteParser(),
            title: 'SwiftTalk Messenger',
          );
        },
      ),
    );
  }
}
