import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key, required this.image, required this.name});
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 9),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.primaryE6F0FE,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: CachedNetworkImageProvider(image),
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) =>
                  Image.asset('assets/logo/hts_plus_logo.png'),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          8.hSpace,
          Text(
            name,
            style: context.textTheme.s10w500.copyWith(
              color: AppColors.primary555F7E,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
