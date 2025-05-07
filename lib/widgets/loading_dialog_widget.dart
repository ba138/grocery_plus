import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:grocery_plus/constants/colors.dart';

class LoadingDialogWidget extends StatelessWidget {
  const LoadingDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var spinkit = SpinKitFadingCube(
      color: AppColors.primaryColor,
      size: 50.0,
    );
    return Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: Center(
        child: spinkit,
      ),
    );
  }
}
