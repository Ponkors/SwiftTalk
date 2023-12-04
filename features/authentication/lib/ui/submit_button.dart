import 'package:authentication/bloc/submit_status.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const SubmitButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context,  AuthenticationState state) {
          return state.statusForm is FormSubmitting
              ? const LoadingIndicator()
              : Container(
                  width: mediaQueryData.size.width * 0.9,
                  height: mediaQueryData.size.height * 0.06,
                  child: ElevatedButton(
                          onPressed: onPressed,
                          child: Text(label),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppDimens.radius_16),
                      ),
                  ),
          ),
        );
      },
    );
  }
}

