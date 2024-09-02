import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/presentation/features/checkout/data/model/get_cart_total_model.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/notifier/apply_coupon_notifier.dart';

class TotalAmountSection extends ConsumerStatefulWidget {
  const TotalAmountSection({super.key, required this.totalAmount});
  final String totalAmount;

  @override
  ConsumerState<TotalAmountSection> createState() => _TotalAmountSectionState();
}

class _TotalAmountSectionState extends ConsumerState<TotalAmountSection> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.watch(applyCouponNotifier).getCartTotalData;
    });

    super.initState();
  }

  GetCartTotalData getCartTotalData = GetCartTotalData();

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(applyCouponNotifier).getCartTotalData;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
      ),
      child: Column(
        children: [
          TotalItemsPriceSection(
            totalAmount: "${widget.totalAmount}",
            
            //"${getCartTotalData.subTotal}",
            Subtotal: "${getCartTotalData.subTotal ?? 0}",
            deliveryFee: "${data?.shippingFee ?? 0}",
            balanceInWallet: "${data?.subTotal ?? 0}",
            grandTotal: "${widget.totalAmount}",
          )
        ],
      ),
    );
  }
}

class TotalItemsPriceSection extends StatelessWidget {
  const TotalItemsPriceSection(
      {super.key,
      required this.totalAmount,
      required this.Subtotal,
      required this.deliveryFee,
      required this.balanceInWallet,
      required this.grandTotal});
  final String totalAmount;
  final String Subtotal;
  final String deliveryFee;
  final String balanceInWallet;
  final String grandTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: context.textTheme.s16w600.copyWith(
                color: AppColors.primarySwatch.shade900,
              ),
            ),
            Text(
              totalAmount,
              style: context.textTheme.s16w600.copyWith(
                color: AppColors.primarySwatch.shade900,
              ),
            )
          ],
        ),
        12.hSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: context.textTheme.s12w500.copyWith(
                color: AppColors.primary8F959E,
              ),
            ),
            Text(
              totalAmount,
              style: context.textTheme.s12w400.copyWith(
                color: AppColors.primary1D1E20,
              ),
            )
          ],
        ),
        12.hSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery fee',
              style: context.textTheme.s12w500.copyWith(
                color: AppColors.primary8F959E,
              ),
            ),
            Text(
              deliveryFee,
              style: context.textTheme.s12w400.copyWith(
                color: AppColors.primary1D1E20,
              ),
            )
          ],
        ),
        12.hSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Balance in your wallet',
              style: context.textTheme.s12w500.copyWith(
                color: AppColors.primary8F959E,
              ),
            ),
            Text(
              balanceInWallet,
              style: context.textTheme.s12w400.copyWith(
                color: AppColors.primary1D1E20,
              ),
            )
          ],
        ),
        12.hSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Grand Total',
              style: context.textTheme.s16w600.copyWith(
                color: AppColors.primarySwatch.shade900,
              ),
            ),
            Text(
              grandTotal,
              style: context.textTheme.s16w600.copyWith(
                color: AppColors.primarySwatch.shade900,
              ),
            )
          ],
        ),
        12.hSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Need corporate invoice?',
              style: context.textTheme.s16w600.copyWith(
                color: AppColors.primarySwatch.shade900,
              ),
            ),
            Text(
              'Add tax id',
              style: context.textTheme.s16w600.copyWith(
                color: AppColors.secondaryColor,
              ),
            )
          ],
        ),
      ],
    );
  }
}
