import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  final Function() onIconPressed;

  const CustomAppBar({
    required this.currentIndex,
    required this.onIconPressed,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    String titleText = '';

    switch (currentIndex) {
      case 0:
        titleText = 'Contacts';
        break;
      case 1:
        titleText = 'Chats';
        break;
      case 2:
        titleText = 'More';
        break;
      default:
        titleText = 'Change Default';
    }

    return AppBar(
      backgroundColor: AppBarColors.backgroundColor,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(titleText),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          color: AppBarColors.buttonColor,
          onPressed: onIconPressed,
        ),
      ],
      elevation: themeData.appBarTheme.elevation,
    );
  }
}