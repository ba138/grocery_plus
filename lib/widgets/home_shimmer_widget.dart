import 'package:flutter/material.dart';
import 'package:grocery_plus/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerWidget extends StatelessWidget {
  const HomeShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.primaryColor.withValues(alpha: 0.8),
        highlightColor: Colors.grey.shade400,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ));
  }
}
