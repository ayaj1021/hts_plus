import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/general_widgets/hts_email_field.dart';
import 'package:hts_plus/presentation/general_widgets/hts_form_field.dart';
import 'package:hts_plus/presentation/general_widgets/hts_password_field.dart';

class SignUpInputSection extends StatelessWidget {
  const SignUpInputSection(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.firstNameController,
      required this.lastNameController,
      required this.reEnterPasswordController});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController reEnterPasswordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.firstName,
          style: context.textTheme.s15w400.copyWith(
            color: AppColors.primary333333,
          ),
        ),
        10.hSpace,
        HTSFormField(
          borderSide: BorderSide.none,
          bordercolor: Colors.transparent,
          controller: firstNameController,
          hintText: 'Enter your first name',
          suffixIcon: Icon(Icons.person_outline),
        ),
        Text(
          Strings.lastName,
          style: context.textTheme.s15w400.copyWith(
            color: AppColors.primary333333,
          ),
        ),
        10.hSpace,
        HTSFormField(
          controller: lastNameController,
          hintText: 'Enter your last name',
          suffixIcon: Icon(Icons.person_outline),
        ),
        Text(
          Strings.emailAddress,
          style: context.textTheme.s15w400.copyWith(
            color: AppColors.primary333333,
          ),
        ),
        10.hSpace,
        HTSEmailField(
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
        Text(
          Strings.reEnterPassword,
          style: context.textTheme.s15w400.copyWith(
            color: AppColors.primary333333,
          ),
        ),
        10.hSpace,
        HTSPasswordField(
          controller: reEnterPasswordController,
          hintText: 'Enter your password',
        ),
      ],
    );
  }
}
