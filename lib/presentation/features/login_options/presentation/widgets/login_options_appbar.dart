import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';

class LoginOptionsAppBar extends StatelessWidget {
  const LoginOptionsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   height: 45,
          //   width: 45,
          //   decoration: BoxDecoration(
          //       shape: BoxShape.circle, color: AppColors.primarySwatch.shade50),
          //   child: Icon(
          //     Icons.arrow_back,
          //     color: AppColors.secondaryColor,
          //   ),
          // ),
          //88.wSpace,
          Text(
            Strings.welcome,
            style: context.textTheme.s20w600.copyWith(
              color: AppColors.white,
            ),
          )
        ],
      ),
    );
  }
}
