import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';

class PromoCodeWidget extends StatelessWidget {
  const PromoCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Strings.promoVoucher,
            style: context.textTheme.s18w500.copyWith(
              color: AppColors.primarySwatch.shade900,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.primaryColor,
            size: 14,
          )
        ],
      ),
    );
  }
}
