
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';

class OptionsButton extends StatelessWidget {
  const OptionsButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.buttonColor});
  final String text;
  final String icon;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 12),
      // height: 48.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          3.wSpace,
          Text(
            text,
            style: context.textTheme.s17w600.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
