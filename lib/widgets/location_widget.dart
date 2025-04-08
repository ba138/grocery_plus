import 'package:flutter/material.dart';
import 'package:grocery_plus/constants/colors.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: AppColors.primaryColor),
        child: Center(
          child: Icon(
            Icons.location_on,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        "Your Location",
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
      ),
      subtitle: Text(
        "32 Llanberis Close, Tonteg, CF38 1HR",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
