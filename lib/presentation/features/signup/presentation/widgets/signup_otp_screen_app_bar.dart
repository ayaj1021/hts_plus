import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';

class SignUpOtpAppBar extends StatelessWidget {
  const SignUpOtpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: ()=> context.pop(),
          child: SvgPicture.asset('assets/icons/arrow_back_icon.svg')),
        SvgPicture.asset('assets/icons/cancel_icon.svg'),
      ],
    );
  }
}
