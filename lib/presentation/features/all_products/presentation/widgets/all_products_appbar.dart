import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';
import 'package:hts_plus/core/theme/app_colors.dart';

class AllProductsAppBar extends StatelessWidget {
  const AllProductsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        // 95.wSpace,
        // Text(
        //   Strings.selectStore,
        //   style: context.textTheme.s18w600.copyWith(
        //     color: AppColors.primary3C4359,
        //   ),
        // )
      ],
    );
  }
}
