import 'package:flutter/material.dart';

import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/general_widgets/hts_form_field.dart';


class ForgotPasswordInputSection extends StatelessWidget {
  const ForgotPasswordInputSection(
      {super.key,
      required this.emailController,
    });
  final TextEditingController emailController;


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
        15.hSpace,
        HTSFormField(
          controller: emailController,
          hintText: 'Enter your email',
          suffixIcon: Icon(Icons.email_outlined),
        ),
      
      ],
    );
  }
}
