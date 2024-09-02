import 'package:flutter/material.dart';

import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/general_widgets/hts_form_field.dart';
import 'package:hts_plus/presentation/general_widgets/hts_password_field.dart';

class LoginInputSection extends StatelessWidget {
  const LoginInputSection(
      {super.key,
      required this.emailController,
      required this.passwordController});
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.emailAddress,
          style: context.textTheme.s15w400.copyWith(
            color: AppColors.primary333333,
          ),
        ),
        10.hSpace,
        HTSFormField(
          controller: emailController,
          hintText: 'Enter your email',
          suffixIcon: Icon(Icons.email_outlined),
        ),
        Text(
          Strings.password,
          style: context.textTheme.s15w400.copyWith(
            color: AppColors.primary333333,
          ),
        ),
        10.hSpace,
        HTSPasswordField(
          controller: passwordController,
          hintText: 'Enter your password',
        ),
      ],
    );
  }
}
