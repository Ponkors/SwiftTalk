import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class HomeTextWidget extends StatelessWidget {
  final String titleText;
  final String mainText;

  HomeTextWidget({required this.titleText, required this.mainText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: AppDimens.padding_25,
          right: AppDimens.padding_25,
      ),
      padding: EdgeInsets.only(
          left: AppDimens.padding_25,
          right: AppDimens.padding_25,
      ),
      height: AppDimens.size_140,
      width: AppDimens.size_400,
      child: Column(
        children: [
          Text(
            titleText,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(textStyle: AppFonts.s28_w700),
          ),
          SizedBox(height: AppDimens.padding_20),
          Text(
            mainText,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(textStyle: AppFonts.s16_w400),
          ),
        ],
      ),
    );
  }
}
