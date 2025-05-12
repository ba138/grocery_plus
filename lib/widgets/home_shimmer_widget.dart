import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerWidget extends StatelessWidget {
  const HomeShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
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
