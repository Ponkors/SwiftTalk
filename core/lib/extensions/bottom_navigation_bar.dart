import 'package:core/enums/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

extension CustomBottomNavigationBarItemEx on CustomBottomNavigationBarItem {
  String get label {
    switch (this) {
      case CustomBottomNavigationBarItem.contacts:
        return 'Contacts';
      case CustomBottomNavigationBarItem.chats:
        return 'Chats';
      case CustomBottomNavigationBarItem.more:
        return 'More';
      default:
        return 'Chats';
    }
  }

  IconData get icon {
    switch (this) {
      case CustomBottomNavigationBarItem.contacts:
        return Icons.people;
      case CustomBottomNavigationBarItem.chats:
        return Icons.chat_outlined;
      case CustomBottomNavigationBarItem.more:
        return Icons.more_horiz;
      default:
        return Icons.chat_outlined;
    }
  }
}