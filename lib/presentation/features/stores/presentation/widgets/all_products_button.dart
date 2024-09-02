import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/features/all_products/presentation/view/all_products_screen.dart';

class AllProductsButton extends StatelessWidget {
  const AllProductsButton({super.key});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
    
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => AllProductsScreen()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        height: 64.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.secondarySwatch.shade50,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppColors.secondarySwatch.shade200,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.secondarySwatch.shade200,
                ),
              ),
              child: SvgPicture.asset('assets/icons/shopping_cart.svg'),
            ),
            12.wSpace,
            Text(
              Strings.shopAllProducts,
              style: context.textTheme.s16w500.copyWith(
                color: AppColors.secondaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
