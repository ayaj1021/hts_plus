import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/general_widgets/hts_form_field.dart';

class SignUpOtpInputSection extends StatelessWidget {
  const SignUpOtpInputSection({super.key, required this.codeController});
  final TextEditingController codeController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.code,
          style: context.textTheme.s15w400.copyWith(
            color: AppColors.primary333333,
          ),
        ),
        10.hSpace,
        HTSFormField(
          controller: codeController,
          hintText: 'Enter otp',
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
