import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool obscureText;
  final Icon icon;
  final String? Function(String?)? validator;

  const AppTextField({
    required this.textEditingController,
    required this.hintText,
    required this.obscureText,
    required this.icon,
    required this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Card(
      shadowColor: AppColors.lightGrey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppDimens.radius_16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.padding_20,
          vertical: AppDimens.padding_10,
        ),
        child: TextFormField(
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                icon,
                SizedBox(width: AppDimens.size_10),
              ],
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: AppDimens.size_20,
              minHeight: AppDimens.size_20,
            ),
            hintText: hintText,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: themeData.primaryColor,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: themeData.primaryColor,
              ),
            ),
          ),
          controller: textEditingController,
          validator: validator,
        ),
      ),
    );
  }
}
