import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AuthenticationWelcomeWidget extends StatelessWidget {
  const AuthenticationWelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width * 0.9,
      height: mediaQuery.size.width * 0.4,
      decoration: BoxDecoration(
        color: AppColors.orange
      ),
    );
  }
}
