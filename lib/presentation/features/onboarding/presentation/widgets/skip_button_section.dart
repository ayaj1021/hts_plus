import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/features/login_options/presentation/views/login_option_screen.dart';

class SkipButtonSection extends StatelessWidget {
  const SkipButtonSection({
    super.key, this.nextOnTap,
  });
final Function()? nextOnTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.pushNamed(LoginOptionScreen.routeName),
            child: Text(
              Strings.skip,
              style:
                  context.textTheme.s15w500.copyWith(
                color: AppColors.primaryFF392B,
              ),
            ),
          ),
          180.wSpace,
          InkWell(
            onTap: nextOnTap,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                  right: 5,
                  left: 14),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(6),
                  color: AppColors.primaryColor),
              child: Row(
                children: [
                  Text(
                    Strings.next,
                    style: context.textTheme.s15w500
                        .copyWith(
                      color: AppColors
                          .primarySwatch.shade50,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
