
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/general_widgets/app_button.dart';
import 'package:hts_plus/presentation/general_widgets/search_text_field.dart';

class EnterLocationBottomWidget extends StatefulWidget {
  const EnterLocationBottomWidget({
    super.key, required this.onTap,
  });
final VoidCallback onTap;

  @override
  State<EnterLocationBottomWidget> createState() => _EnterLocationBottomWidgetState();
}

class _EnterLocationBottomWidgetState extends State<EnterLocationBottomWidget> {
   final _locationSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 250.h,
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: const BoxDecoration(
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
            // GestureDetector(
            //   onTap: () => context.pushNamed(EnterLocationScreen.routeName),
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 20,
            //       vertical: 10,
            //     ),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(8),
            //         border: Border.all(
            //           color: AppColors.primaryCACDD7,
            //         )),
            //     child: Row(
            //       children: [
            //         const Icon(
            //           Icons.search,
            //           color: AppColors.primary7E84A3,
            //         ),
            //         10.wSpace,
            //         Text(
            //           Strings.enterANewAddress,
            //           style: context.textTheme.s16w400.copyWith(
            //             color: AppColors.primaryA1A7CA,
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),

             SearchTextField(
          // onChanged: (value) {
          //   placeAutoComplete(value);
          // },
          hintText: 'Enter Location',
          controller: _locationSearchController,
        ),
            
            24.hSpace,
            ButtonWidget(
              onTap: widget.onTap,
              text: Strings.confirmLocation,
              
            )
          ],
        ),
      ),
    );
  }
}
