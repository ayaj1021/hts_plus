import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/widgets/full_description_screen.dart';

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget(
      {super.key,
    
      required this.productTitle,
      required this.productAmount,
      required this.productLocation,
      required this.productBrand,
      required this.productRating,
      required this.productReview,
      required this.productDescription,
      required this.productLogo, required this.productStoreName});

  final String productTitle;
  final String productAmount;
  final String productLocation;
  final String productBrand;
  final String productRating;
  final String productReview;
  final String productDescription;
  final String productLogo;
  final String productStoreName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
        Text(
          productTitle,
          style: context.textTheme.s24w500.copyWith(
            color: AppColors.primarySwatch.shade900,
          ),
        ),
        12.hSpace,
        Text(
          productAmount,
          style: context.textTheme.s22w800.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        8.hSpace,
        Text(
          productLocation,
          style: context.textTheme.s14w400.copyWith(
            color: AppColors.primaryB8B8B8,
          ),
        ),
        8.hSpace,
        RichText(
            text: TextSpan(
          text: 'Brand: ',
          style: context.textTheme.s14w500.copyWith(
            color: AppColors.primaryB8B8B8,
          ),
          children: [
            TextSpan(
              text: productBrand,
              style: context.textTheme.s14w500.copyWith(
                color: AppColors.primary549DF8,
              ),
            ),
            TextSpan(
              text: ' | ',
              style: context.textTheme.s14w500.copyWith(
                color: AppColors.primaryB8B8B8,
              ),
            ),
            TextSpan(
              text: 'Similar products from $productBrand',
              style: context.textTheme.s14w500.copyWith(
                color: AppColors.primary549DF8,
              ),
            ),
          ],
        )),
        8.hSpace,
        Row(
          children: [
            Icon(
              Icons.star,
              color: AppColors.primaryECA61B,
            ),
            4.wSpace,
            Text(
              productRating,
              style: context.textTheme.s14w800.copyWith(
                color: AppColors.primary303539,
              ),
            ),
            Text(
              ' $productReview Reviews',
              style: context.textTheme.s14w800.copyWith(
                color: AppColors.secondaryColor,
                // decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        16.hSpace,
        Text(
          Strings.description,
          style: context.textTheme.s17w700.copyWith(
            color: AppColors.primarySwatch.shade900,
            // decoration: TextDecoration.underline,
          ),
        ),
        Divider(
          color: AppColors.primaryEEEFF2,
        ),
        13.hSpace,
        RichText(
          text: TextSpan(
              text: productDescription,
              style: context.textTheme.s15w400.copyWith(
                color: AppColors.primary8F959E,
              ),
              children: [
                TextSpan(
                  text: ' Read More...',
                  style: context.textTheme.s15w400.copyWith(
                    color: AppColors.primaryColor,
                    // decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => FullDescriptionScreen()));
                      // context.pushNamed(SignUpScreen.routeName);
                    },
                ),
              ]),
          //  maxLines: 2,
        ),
        16.hSpace,
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: AppColors.primarySwatch.shade200,
                  )),
              child: ClipOval(child: Image.network(productLogo)),
            ),
            12.wSpace,
          Text(
              productStoreName,
              style: context.textTheme.s14w500.copyWith(
                color: AppColors.primary8D94A9,
                // decoration: TextDecoration.underline,
              ),
            ),
          ],
        )
      ],
    );
  }
}
