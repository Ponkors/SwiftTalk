import 'package:core/core.dart';
import 'package:core/enums/bottom_navigation_bar.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final List<BottomNavigationBarItem> items = CustomBottomNavigationBarItem
        .values
        .map((CustomBottomNavigationBarItem item) {
      return BottomNavigationBarItem(
        icon: currentIndex == CustomBottomNavigationBarItem.values.indexOf(item)
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(item.label),
            SizedBox(height: AppDimens.size_5),
            Icon(Icons.circle, size: AppDimens.size_8),
          ],
        )
            : Icon(item.icon),
        label: '',
      );
    }).toList();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.padding_5),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.radius_16)),
        child: BottomNavigationBar(
          items: items,
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: BottomNavigationBarColors.backgroundColor,
          selectedItemColor: BottomNavigationBarColors.selectedItemsColor,
          unselectedItemColor: BottomNavigationBarColors.unselectedItemsColor,
        ),
      ),
    );
  }
}
