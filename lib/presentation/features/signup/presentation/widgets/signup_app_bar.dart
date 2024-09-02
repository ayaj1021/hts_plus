import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpAppBar extends StatelessWidget {
  const SignUpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset('assets/icons/arrow_back_icon.svg'),
        SvgPicture.asset('assets/icons/cancel_icon.svg'),
      ],
    );
  }
}
