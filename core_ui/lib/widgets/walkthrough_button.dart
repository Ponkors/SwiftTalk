import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalkthroughButton extends StatelessWidget {
  final VoidCallback onPressed;

  const WalkthroughButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: AppColors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.size_25),
        ),
        minimumSize: Size(
            AppDimens.size_360,
            AppDimens.size_50,
        ),
      ),
      child: Text(
        AppConstants.startMessaging,
        style: GoogleFonts.gothicA1(
          color: AppColors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.1,
        ),
      ),
    );
  }
}
