import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final showLogoutButton;

  const CustomAppBar({
    this.title = '',
    this.showLogoutButton = true,
    super.key
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final AuthenticationBloc authenticationBloc = BlocProvider.of(context);
    return AppBar(
        backgroundColor: themeData.primaryColor,
        title: Text(
          title,
        ),
        actions: showLogoutButton
            ? <Widget>[
          IconButton(
            onPressed: () {
              authenticationBloc.add(
                SignOutSubmitted(),
              );
              authenticationBloc.add(
                NavigateToSignInScreen(),
              );
            },
            icon: const Icon(
              Icons.logout,
              color: AppColors.white,
            ),
          ),
        ]
            : []
    );
  }
}
