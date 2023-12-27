import 'package:flutter/material.dart';

class MoreListItem extends StatelessWidget {
  final String itemText;
  final IconData icon;

  const MoreListItem({
    required this.itemText, required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(itemText),
    );
  }
}
