import 'package:core/enums/app_bar.dart';

extension CustomAppBarItemEx on CustomAppBarItem {
  String get title {
    switch (this) {
      case CustomAppBarItem.contacts:
        return 'Contacts';
      case CustomAppBarItem.chats:
        return 'Chats';
      case CustomAppBarItem.more:
        return 'More';
      default:
        return 'Default';
    }
  }
}