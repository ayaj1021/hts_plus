import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/features/login/presentation/view/login_screen.dart';
import 'package:hts_plus/presentation/features/login_options/presentation/widgets/options_button.dart';
import 'package:hts_plus/presentation/features/signup/presentation/views/signup_screen.dart';
import 'package:hts_plus/presentation/general_widgets/app_button.dart';

class LoginOptionsSection extends StatelessWidget {
  const LoginOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 39, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Text(
            Strings.letsGetStarted,
            style: context.textTheme.s24w600.copyWith(
              color: AppColors.primarySwatch.shade900,
            ),
          ),
          Text(
            Strings.lorem,
            style: context.textTheme.s12w400.copyWith(
              color: AppColors.primarySwatch.shade900,
            ),
            textAlign: TextAlign.center,
          ),
          26.hSpace,
          OptionsButton(
            text: 'Google',
            icon: 'assets/icons/google_icon.svg',
            buttonColor: AppColors.primaryF81704,
          ),
          10.hSpace,
          OptionsButton(
            text: 'Whatsapp',
            icon: 'assets/icons/whatsapp_icon.svg',
            buttonColor: AppColors.primary25D366,
          ),
          23.hSpace,
          Divider(
            color: AppColors.primaryCACDD7,
          ),
          22.hSpace,
          ButtonWidget(
            text: Strings.createAnAccount,
            onTap: () => context.pushNamed(
              SignUpScreen.routeName,
            ),
          ),
          10.hSpace,
          RichText(
            text: TextSpan(
              text: Strings.alreadyHaveAnAccount,
              style: context.textTheme.s14w400.copyWith(
                color: AppColors.primary555F7E,
              ),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.pushNamed(LoginScreen.routeName);
                    },
                  text: Strings.logIn,
                  style: context.textTheme.s14w400.copyWith(
                    color: AppColors.primaryColor,
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
