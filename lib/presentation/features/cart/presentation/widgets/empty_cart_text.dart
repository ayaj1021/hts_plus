import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';

class EmptyCartText extends StatelessWidget {
  const EmptyCartText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 62, vertical: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty_cart_image.png',
            height: 134,
            width: 134,
          ),
          22.hSpace,
          Text(
            Strings.looksLikeYourCartIsEmpty,
            style: context.textTheme.s18w600.copyWith(
              color: AppColors.primarySwatch.shade900,
            ),
          ),
          6.hSpace,
          Text(Strings.startShoppingAndAdd,
              style: context.textTheme.s12w400.copyWith(
                color: AppColors.primarySwatch.shade400,
              ),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
