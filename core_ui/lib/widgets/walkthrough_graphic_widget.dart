import 'package:flutter/material.dart';

class WalkthroughGraphicWidget extends StatelessWidget {
  final String imagePath;

  const WalkthroughGraphicWidget({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath);
  }
}
