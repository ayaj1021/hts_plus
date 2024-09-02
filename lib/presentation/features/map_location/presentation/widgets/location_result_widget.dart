import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hts_plus/core/theme/app_colors.dart';

class LocationResultWidget extends StatelessWidget {
  const LocationResultWidget(
      {super.key, required this.location, required this.press});

  final String location;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          leading: SvgPicture.asset('assets/icons/location_icon.svg'),
          title: Text(
            location,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Divider(
          color: AppColors.primaryF1F3F9,
        ),
      ],
    );
  }
}
