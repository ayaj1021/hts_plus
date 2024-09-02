import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 85.h,
          width: 85.w,
          child: Image.asset('assets/logo/hts_plus_logo.png'),
        ),
        33.hSpace,
        Text(
          title,
          style: context.textTheme.s30w600.copyWith(
            color: AppColors.primary113616,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
