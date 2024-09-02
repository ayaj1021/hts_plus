
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/features/map_location/presentation/views/enter_location_screen.dart';
import 'package:hts_plus/presentation/general_widgets/app_button.dart';

class EnterLocationBottomWidget extends StatelessWidget {
  const EnterLocationBottomWidget({
    super.key, required this.onTap,
  });
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 250.h,
        width: double.infinity,
        padding: EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 4.h,
              width: 91.w,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(2)),
            ),
            25.hSpace,
            Text(
              Strings.chooseAndConfirmAddress,
              style: context.textTheme.s15w400.copyWith(
                color: AppColors.primary959595,
              ),
            ),
            14.hSpace,
            GestureDetector(
              onTap: () => context.pushNamed(EnterLocationScreen.routeName),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.primaryCACDD7,
                    )),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: AppColors.primary7E84A3,
                    ),
                    10.wSpace,
                    Text(
                      Strings.enterANewAddress,
                      style: context.textTheme.s16w400.copyWith(
                        color: AppColors.primaryA1A7CA,
                      ),
                    )
                  ],
                ),
              ),
            ),
            24.hSpace,
            ButtonWidget(
              onTap: onTap,
              text: Strings.confirmLocation,
              
            )
          ],
        ),
      ),
    );
  }
}
