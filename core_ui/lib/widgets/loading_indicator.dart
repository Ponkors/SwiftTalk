import 'package:flutter/cupertino.dart';
import 'package:core_ui/core_ui.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        color: AppColors.grey,
        radius: AppDimens.radius_16,
      ),
    );
  }
}
