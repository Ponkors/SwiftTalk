import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CategoryTabItem extends StatelessWidget {
  final String titleText;

  CategoryTabItem({required this.titleText});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return InkWell(
      splashColor: AppColors.blue,
      borderRadius: const BorderRadius.all(Radius.circular(AppDimens.radius20)),
      onTap: () {},
      child: Card(
        shadowColor: AppColors.lightGrey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.size25)),
        ),
        child: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height * 0.05,
          color: AppColors.green,
          child: Row(
            children: <Widget>[
              Icon(Icons.person),
              SizedBox(width: AppDimens.size5,),
              Text(titleText)
            ],
          ),
        ),
      ),
    );
  }
}
