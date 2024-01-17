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
        Radius.circular(16),
      ),
      onTap: onTap,
      child: Card(
        shadowColor: Colors.lightBlue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Container(
          height: 30,
          child: Row(
            children: <Widget>[
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Icon(Icons.person),
                  Text(user!.userName ?? "?"),
                  const SizedBox(height: 5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
