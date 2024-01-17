import 'package:flutter/material.dart';
import 'more_list_item.dart';

class MoreListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {"icon": Icons.star, "text": "Item 1"},
    {"icon": Icons.favorite, "text": "Item 2"},
    {"icon": Icons.camera, "text": "Item 3"},
    {"icon": Icons.music_note, "text": "Item 4"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Список элементов"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return MoreListItem(
            icon: items[index]["icon"],
            itemText: items[index]["text"],
          );
        },
      ),
    );
  }
}
