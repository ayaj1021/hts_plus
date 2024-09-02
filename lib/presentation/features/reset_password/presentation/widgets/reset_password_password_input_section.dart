import 'package:flutter/material.dart';

import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/general_widgets/hts_form_field.dart';
import 'package:hts_plus/presentation/general_widgets/hts_password_field.dart';

class ResetPasswordInputSection extends StatelessWidget {
  const ResetPasswordInputSection({
    super.key,
    required this.passwordHintController,
    required this.passwordController,
    required this.reEnterPasswordController,
  });
  final TextEditingController passwordHintController;
  final TextEditingController passwordController;
  final TextEditingController reEnterPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.password,
          style: context.textTheme.s15w400.copyWith(
            color: AppColors.primary333333,
          ),
        ),
        HTSPasswordField(
          controller: passwordController,
          hintText: 'Enter your password',
        ),
        10.hSpace,
        Text(
          Strings.reEnterPassword,
          style: context.textTheme.s15w400.copyWith(
            color: AppColors.primary333333,
          ),
        ),
        HTSPasswordField(
          controller: reEnterPasswordController,
          hintText: 'Re-enter your password',
        ),
        10.hSpace,
          Text(
          Strings.passwordHint,
          style: context.textTheme.s15w400.copyWith(
            color: AppColors.primary333333,
          ),
        ),
        HTSFormField(
          controller: passwordHintController,
          hintText: 'Enter password hint',
        ),
      ],
    );
  }
}
