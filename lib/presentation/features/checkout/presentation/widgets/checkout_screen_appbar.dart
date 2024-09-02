import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';

class CheckOutScreenAppBar extends StatelessWidget {
  const CheckOutScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primarySwatch.shade50,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset('assets/icons/arrow_back_icon.svg'),
          ),
        ),
        Text(
          Strings.checkOut,
          style: context.textTheme.s18w600.copyWith(
            color: AppColors.primarySwatch.shade700,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primarySwatch.shade50,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset('assets/icons/cancel_icon.svg')),
        ),
      ],
    );
  }
}
