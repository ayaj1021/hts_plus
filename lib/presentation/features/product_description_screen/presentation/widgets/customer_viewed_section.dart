import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/features/all_products/presentation/widgets/all_products_section.dart';

class CustomerViewedSection extends StatelessWidget {
  const CustomerViewedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            Strings.customerAlsoViewed,
            style: context.textTheme.s14w700.copyWith(
              color: AppColors.primarySwatch.shade900,
              // decoration: TextDecoration.underline,
            ),
          ),
        ),
       // 22.hSpace,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(products.length, (index) {
              return CustomerViewedContainer(
                image: products[index]['image'],
                amount: products[index]['amount'],
                title: products[index]['title'],
                initialAmount: products[index]['initialAmount'],
                discount: products[index]['discount'],
              );
            }),
          ),
        )
      ],
    );
  }
}


class CustomerViewedContainer extends ConsumerWidget {
  const CustomerViewedContainer(
      {super.key,
      required this.image,
      required this.amount,
      required this.title,
      required this.initialAmount,
      required this.discount});
  final String image;
  final String amount;
  final String initialAmount;
  final String title;
  final String discount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // height: 590,
      width: 200.w,
      margin: EdgeInsets.only( left: 16),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: AppColors.primarySwatch.shade100,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColors.primaryFBE8E8, shape: BoxShape.circle),
                child: Icon(Icons.favorite_border_outlined,
                    color: AppColors.primaryD21C1C),
              ),
            ],
          ),
          5.hSpace,
          SizedBox(
            height: 110.h,
            width: 78.w,
            child: Image.asset(image, fit: BoxFit.cover,),
          ),
          SizedBox(
            width: 108.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  amount,
                  style: context.textTheme.s16w700.copyWith(
                    color: AppColors.primarySwatch.shade800,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      initialAmount,
                      style: context.textTheme.s12w400.copyWith(
                        color: AppColors.primary1B1C1E.withOpacity(0.5),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    4.wSpace,
                    Text(
                      discount,
                      style: context.textTheme.s12w400.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  title,
                  style: context.textTheme.s12w400.copyWith(
                    color: AppColors.primary2F3445,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
