import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:authentication/authentication.dart';
import 'package:contacts/contacts.dart';
import 'package:chat/chat.dart';
import 'package:more/more.dart';
import 'package:router/bloc/router_bloc.dart';


class HomePage extends StatelessWidget {
  final UserEntity authenticatedUser;

  const HomePage({
    required this.authenticatedUser,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RouterBloc(),
      child: HomeView(
        authenticatedUser: authenticatedUser,
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  final UserEntity authenticatedUser;
  const HomeView({
    required this.authenticatedUser,
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(AuthenticationRemoved());
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedItem,
        onTap: _onBottomNavigationBarTapped,
        items: const [
          BottomNavigationBarItem(
            label: 'Contacts',
            icon: Icon(Icons.contacts_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Chat',
            icon: Icon(Icons.chat_bubble_outline_rounded),
          ),
          BottomNavigationBarItem(
            label: 'More',
            icon: Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: _homeBodyBuilder(context),
    );
  }

  Widget _homeBodyBuilder(BuildContext context) {
    return BlocBuilder<RouterBloc, RouterState>(
      builder: (context, state) {
        if (state is RouterContact) {
          return ContactScreen(authenticatedUser: widget.authenticatedUser);
        } else if (state is RouterChat) {
          return ChatScreen(authenticatedUser: widget.authenticatedUser);
        } else if (state is RouterMore) {
          return MoreScreen();
        } else {
          return Center(
            child: Text('Your login ${widget.authenticatedUser.userName}'),
          );
        }
      },
    );
  }

  void _onBottomNavigationBarTapped(int value) {
    if (value == 0) {
      BlocProvider.of<RouterBloc>(context).add(RouterContactTapped());
    } else if (value == 1) {
      BlocProvider.of<RouterBloc>(context).add(RouterChatTapped());
    } else {
      BlocProvider.of<RouterBloc>(context).add(RouterMoreTapped());
    }
    setState(() => selectedItem = value);
  }
}

// class RouterLogicScreen extends StatelessWidget {
//   final UserEntity authenticatedUser;
//
//   const RouterLogicScreen({
//     required this.authenticatedUser,
//     Key? key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => RouterBloc(),
//       child: RouterView(
//         authenticatedUser: authenticatedUser,
//       ),
//     );
//   }
// }
//
// class RouterView extends StatefulWidget {
//   final UserEntity authenticatedUser;
//   const RouterView({
//     required this.authenticatedUser,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<RouterView> createState() => _RouterViewState();
// }
//
// class _RouterViewState extends State<RouterView> {
//   int selectedItem = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('AppBar'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               BlocProvider.of<AuthenticationBloc>(context).add(SignOutSubmitted());
//               BlocProvider.of<AuthenticationBloc>(context).add(NavigateToSignInScreen());
//             },
//             icon: const Icon(Icons.exit_to_app),
//           )
//         ],
//       ),
//       body: _routerBodyBuilder(context),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedItem,
//         onTap: _onBottomNavigationbarTapped,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.contacts_rounded),
//             label: 'Contacts',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.chat_rounded),
//             label: 'Chat',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.more_horiz),
//             label: 'More',
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _routerBodyBuilder(BuildContext context) {
//     return BlocBuilder<RouterBloc, RouterState>(
//       builder: (context, state) {
//         if (state is RouterContact) {
//           return ContactScreen(authenticatedUser: widget.authenticatedUser);
//         } else if (state is RouterChat) {
//           return ChatScreen(authenticatedUser: widget.authenticatedUser);
//         } else {
//           return Center(
//             child: Text('You are ${widget.authenticatedUser.userName}'),
//           );
//         }
//       },
//     );
//   }
//
//   void _onBottomNavigationbarTapped(int value) {
//     if (value == 0) {
//       BlocProvider.of<RouterBloc>(context).add(RouterContactTapped());
//     } else if (value == 1) {
//       BlocProvider.of<RouterBloc>(context).add(RouterChatTapped());
//     } else {
//       BlocProvider.of<RouterBloc>(context).add(RouterMoreTapped());
//     }
//     setState(() => selectedItem = value);
//   }
// }






//
// class RoutingLogicScreen extends StatelessWidget {
//   const RoutingLogicScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final AuthenticationBloc authenticationBloc = BlocProvider.of(context);
//     final UserModel authenticatedUser;
//     return MultiBlocProvider(
//       providers: <BlocProvider>[
//         BlocProvider<AuthenticationBloc>(
//           create: (_) => AuthenticationBloc(
//               signInUseCase: getIt.get<SignInUseCase>(),
//               signUpUseCase: getIt.get<SignUpUseCase>(),
//               signOutUseCase: getIt.get<SignOutUseCase>(),
//               signInWithGoogleUseCase: getIt.get<SignInWithGoogleUseCase>(),
//               resetPasswordUseCase: getIt.get<ResetPasswordUseCase>(),
//               getUserFromStorageUseCase: getIt.get<GetUserFromStorageUseCase>(),
//               appRouter: getIt.get<AppRouter>(),
//           ),
//         ),
//         BlocProvider<ContactsBloc>(
//             create: (_) => ContactsBloc(
//               contactsRepository: getIt.get<ContactsRepository>(),
//             ),
//         ),
//         BlocProvider<ChatBloc>(
//           create: (_) => ChatBloc(
//             chatRepository: getIt.get<ChatRepository>(),
//           ),
//         )
//       ],
//       child: AutoTabsScaffold(
//         animationCurve: Curves.linear,
//         animationDuration: const Duration(
//           milliseconds: 250,
//         ),
//         routes: const <PageRouteInfo<dynamic>>[
//           ContactsRoute(),
//           ChatRoute(authenticatedUser: authenticatedUser),
//           MoreRoute(),
//         ],
//         builder: (_, Widget? child, Animation<double> animation) {
//           return SlideTransition(
//             position: animation.drive(
//               Tween<Offset>(
//                 begin: const Offset(0, 1),
//                 end: const Offset(0, 0),
//               ),
//             ),
//             child: child,
//           );
//         },
//         appBarBuilder: (_, TabsRouter tabsRouter) {
//           return CustomAppBar(
//             currentIndex: tabsRouter.activeIndex,
//             onIconPressed: () {
//               authenticationBloc.add(SignOutSubmitted());
//               authenticationBloc.add(NavigateToSignInScreen());
//             },
//           );
//         },
//         bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
//           return CustomBottomNavigationBar(
//             currentIndex: tabsRouter.activeIndex,
//             onTap: tabsRouter.setActiveIndex,
//           );
//         },
//       ),
//     );
//   }
// }


