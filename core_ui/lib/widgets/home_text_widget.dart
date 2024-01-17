import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class HomeTextWidget extends StatelessWidget {
  final String titleText;
  final String mainText;

  HomeTextWidget({
    required this.titleText,
    required this.mainText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: AppDimens.padding25,
        right: AppDimens.padding25,
      ),
      padding: EdgeInsets.only(
        left: AppDimens.padding25,
        right: AppDimens.padding25,
      ),
      height: AppDimens.size140,
      width: AppDimens.size400,
      child: Column(
        children: [
          Text(
            titleText,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(textStyle: AppFonts.s28w700),
          ),
          SizedBox(height: AppDimens.padding20),
          Text(
            mainText,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(textStyle: AppFonts.s16w400),
          ),
        ],
      ),
    );
  }
}
