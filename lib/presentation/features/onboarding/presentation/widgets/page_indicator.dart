
import 'package:flutter/material.dart';
import 'package:hts_plus/core/theme/app_colors.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    required this.position,
    required this.count,
    super.key,
    this.enabledColor,
    this.disabledColor,
    this.height = 3,
    this.width = 30,
  }) : assert(position <= count, 'Position should be less that count.');
  final int count;
  final int position;
  final Color? enabledColor;
  final Color? disabledColor;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => AnimatedContainer(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: index == position
                ? enabledColor ?? AppColors.secondaryColor
                : disabledColor ?? AppColors.secondarySwatch.shade100,
            borderRadius: BorderRadius.circular(26),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        ),
      ),
    );
  }
}
