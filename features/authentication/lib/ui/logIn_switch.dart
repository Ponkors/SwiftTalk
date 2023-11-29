import 'package:flutter/material.dart';

class LogInSwitch extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final String title;

  const LogInSwitch({
    required this.onPressed,
    required this.label,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        TextButton(
          onPressed: onPressed,
          child: Text(label),
        )
      ],
    );
  }
}
