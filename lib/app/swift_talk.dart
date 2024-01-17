import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:contacts/contacts.dart';
import 'package:navigation/navigation.dart';
import 'package:authentication/authentication.dart';
import 'package:router/router.dart';

class SwiftTalkApp extends StatelessWidget {
  const SwiftTalkApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: AppColors.blue),
        //colorscheme:
      ),
      home: BlocProvider(
        create: (context) => AuthenticationBloc(
          authenticationRepository: getIt.get<AuthenticationRepository>(),
        )..add(AuthenticationVerified()),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationFailure) {
          return const LoginScreen();
        } else if (state is AuthenticationSuccess) {
          return HomePage(authenticatedUser: state.user);
        } else if (state is AuthenticationInProgress) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        {
          return Text('error: ${state.runtimeType}');
        }
      },
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: <BlocProvider>[
//         BlocProvider<AuthenticationBloc>(
//           create: (_) => AuthenticationBloc(
//             signInUseCase: getIt.get<SignInUseCase>(),
//             signUpUseCase: getIt.get<SignUpUseCase>(),
//             signOutUseCase: getIt.get<SignOutUseCase>(),
//             signInWithGoogleUseCase: getIt.get<SignInWithGoogleUseCase>(),
//             resetPasswordUseCase: getIt.get<ResetPasswordUseCase>(),
//             getUserFromStorageUseCase: getIt.get<GetUserFromStorageUseCase>(),
//             appRouter: getIt.get<AppRouter>(),
//           )..add(InitAuthentication()),
//         ),
//       ],
//       child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
//         builder: (BuildContext context, AuthenticationState state) {
//           return MaterialApp.router(
//             builder: (BuildContext context, Widget? child) {
//               final MediaQueryData mediaQueryData = MediaQuery.of(context);
//               return MediaQuery(
//                 data: mediaQueryData.copyWith(),
//                 child: child!,
//               );
//             },
//             // routerDelegate: getIt.get<AppRouter>().delegate(),
//             // routeInformationParser: getIt.get<AppRouter>().defaultRouteParser(),
//             title: 'SwiftTalk Messenger',
//           );
//         },
//       ),
//     );
//   }
// }
