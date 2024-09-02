import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';

class MapScreenAppBar extends StatelessWidget {
  const MapScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.secondarySwatch.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.secondaryColor,
              )
              //SvgPicture.asset('assets/icons/arrow_back_icon.svg'),
              ),
        ),
        75.wSpace,
        Text(
          Strings.deliveryAddress,
          style: context.textTheme.s18w600.copyWith(
            color: AppColors.primary3C4359,
          ),
        ),
      ],
    );
  }
}
