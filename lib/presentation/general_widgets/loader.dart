import 'package:flutter/material.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoaderDialog {
  static Future showLoadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Center(
            child: LoadingAnimationWidget.fourRotatingDots(
              color: AppColors.primaryColor,
              // rightDotColor: Colors.black,
              size: 100,
            ),
          ),
        );
      },
    );
  }

  static Future<void> showNoInternet(BuildContext context, GlobalKey key) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          key: key,
          elevation: 0.0,
          backgroundColor: Colors.white,
          child: Center(
            child: Image.asset(
              'assets/images/loading.gif',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        );
      },
    );
  }
}
