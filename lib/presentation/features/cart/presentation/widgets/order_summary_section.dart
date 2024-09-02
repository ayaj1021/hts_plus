import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/widgets/checkout_section.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/widgets/checkout_item_card.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({
    super.key,
    required this.widget,
  });

  final CheckOutSection widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 24,
      ),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.orderSummary,
            style: context.textTheme.s14w600.copyWith(
              color: AppColors.primarySwatch.shade900,
            ),
          ),
          22.hSpace,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                widget.cartItems.length,
                (index) {
                  final data = widget.cartItems[index];
                  return CheckOutItemCard(
                    image: '${data.product?.cloudinaryUrls?.first}',
                    itemName: '${data.product?.name}',
                    itemAmount: '${data.price}',
                    id: data.product?.id ?? 0,
                    quantity: '${data.quantity}',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
