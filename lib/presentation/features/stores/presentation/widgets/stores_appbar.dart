import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';

class StoresAppBar extends StatelessWidget {
  const StoresAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
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
        95.wSpace,
        Text(
          Strings.selectStore,
          style: context.textTheme.s18w600.copyWith(
            color: AppColors.primary3C4359,
          ),
        )
      ],
    );
  }
}
