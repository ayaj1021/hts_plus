import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';

class WishListAppBar extends StatelessWidget {
  const WishListAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       
        Text(
          Strings.wishList,
          style: context.textTheme.s18w600.copyWith(
            color: AppColors.primarySwatch.shade700,
          ),
        ),
      
      ],
    );
  }
}
