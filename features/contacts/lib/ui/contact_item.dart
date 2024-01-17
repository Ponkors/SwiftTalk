import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final UserModel? user;
  final VoidCallback onTap;

  const ContactItem({
    Key? key,
    this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blue,
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.radius16),
      ),
      onTap: onTap,
      child: Card(
        shadowColor: Colors.lightBlue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.radius16),
          ),
        ),
        child: Container(
          height: AppDimens.size30,
          child: Row(
            children: <Widget>[
              const SizedBox(height: AppDimens.size16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Icon(Icons.person),
                  Text(user!.userName ?? "?"),
                  const SizedBox(height: AppDimens.size5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
