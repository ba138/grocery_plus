import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final VoidCallback ontap;
  const ProfileWidget(
      {super.key,
      required this.leadingIcon,
      required this.title,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(leadingIcon),
              const SizedBox(
                width: 8,
              ),
              Text(title),
            ],
          ),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
