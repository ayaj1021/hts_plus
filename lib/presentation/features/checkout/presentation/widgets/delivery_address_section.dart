import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';

class DeliveryAddressSection extends StatelessWidget {
  const DeliveryAddressSection({super.key});

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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.deliveryAddress,
                    style: context.textTheme.s14w600.copyWith(
                      color: AppColors.primarySwatch.shade900,
                    ),
                  ),
                  4.hSpace,
                  Text(
                    Strings.yourOrderWillBeDeliveredTo,
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
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.secondarySwatch.shade100),
            ),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/location_icon.svg'),
                14.wSpace,
                Expanded(
                  child: Text(
                    'No 13, Ikate Street, lekki Epe, Lagos, Nigeria, london, enugu',
                    style: context.textTheme.s14w500.copyWith(
                      color: AppColors.primary1D1E20,
                    ),
                   maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
