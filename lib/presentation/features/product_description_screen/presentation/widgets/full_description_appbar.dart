
import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';

class FullDescriptionAppBar extends StatelessWidget {
  const FullDescriptionAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => context.pop(context),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondarySwatch.shade50,
            ),
            child: Icon(
              Icons.arrow_back,
              color: AppColors.secondaryColor,
            ),
          ),
        ),
        80.wSpace,
        Text(
          Strings.productDetails,
          style: context.textTheme.s18w600.copyWith(
            color: AppColors.primary3C4359,
          ),
        ),
        //   GestureDetector(
        //   onTap: () => context.pop(context),
        //   child: Container(
        //     padding: EdgeInsets.all(8),
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       color: AppColors.secondarySwatch.shade50,
        //     ),
        //     child: Icon(
        //       Icons.cancel_outlined,
        //       color: AppColors.secondaryColor,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
