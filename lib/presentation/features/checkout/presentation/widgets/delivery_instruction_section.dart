import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';

class DeliveryInstructionSection extends StatelessWidget {
  const DeliveryInstructionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
      ),
      child: 
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.deliveryInstruction,
                    style: context.textTheme.s14w600.copyWith(
                      color: AppColors.primarySwatch.shade900,
                    ),
                  ),
                  4.hSpace,
                  Text(
                    Strings.anySpecificInstructions,
                    style: context.textTheme.s12w400.copyWith(
                      color: AppColors.primaryB1B5C4,
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 27.h,
              //   width: 27.w,
              //   child: Image.asset('assets/icons/edit_icon.png'),
              // ),
            ],
          ),
          22.hSpace,
          Container(
              padding: EdgeInsets.symmetric(
                horizontal: 6,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.primaryCACDD7),
              ),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'For example: please do not ring the bell.',
                  hintStyle: context.textTheme.s14w500.copyWith(
                    color: AppColors.primaryCACDD7,
                  ),
                ),
              )),
        ],
      ),
    
    
    );
  }
}
