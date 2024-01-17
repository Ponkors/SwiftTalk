import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalkthroughTextWidget extends StatelessWidget {
  final String titleText;
  final String mainText;

  WalkthroughTextWidget({
    required this.titleText,
    required this.mainText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimens.padding25),
      padding: EdgeInsets.symmetric(horizontal: AppDimens.padding25),
      height: AppDimens.size170,
      width: AppDimens.size400,
      child: Column(
        children: [
          Text(
            titleText,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: AppDimens.size20),
          Text(
            mainText,
            textAlign: TextAlign.center,
            style: GoogleFonts.gothicA1(
              color: AppColors.black,
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}
