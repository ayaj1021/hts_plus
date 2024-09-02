import 'package:flutter/material.dart';

import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/presentation/general_widgets/app_loader.dart';

class ButtonWidget extends StatelessWidget {
  final Color? buttonColor;
  final Color? buttonTextColor;
  final String text;
  final Border? buttonBorder;
  final Function()? onTap;
  final double? width;
  final bool isLoading;
  final bool isEnabled;

  const ButtonWidget({
    super.key,
    this.buttonColor,
    required this.text,
    this.buttonBorder,
    this.buttonTextColor,
    this.onTap,
    this.width,
    this.isLoading = false,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        // height: 48.h,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.primaryColor,
          border: buttonBorder,
          // color: buttonColor,

          borderRadius: BorderRadius.circular(6),
        ),
        child: isLoading
            ? const Center(child: AppLoader())
            : Text(
                text,
                style: context.textTheme.s14w700.copyWith(
                  color: buttonTextColor ?? AppColors.white,
                ),
              ),
      ),
    );
  }
}
