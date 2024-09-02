import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/extensions/overlay_extension.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/features/cart/data/model/get_cart_model.dart';
import 'package:hts_plus/presentation/features/checkout/data/model/apply_coupon_request.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/notifier/apply_coupon_notifier.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/view/checkout_screen.dart';
import 'package:hts_plus/presentation/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:hts_plus/presentation/features/cart/presentation/widgets/promo_code_widget.dart';
import 'package:hts_plus/presentation/general_widgets/app_button.dart';

class CartItems extends ConsumerStatefulWidget {
  CartItems({super.key, required this.cartItems});

  final List<GetCartData> cartItems;

  @override
  ConsumerState<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends ConsumerState<CartItems> {
  void _applyCoupon() {
    final data = ApplyCouponRequest(
      productId: "${widget.cartItems.first.productId}",
      quantity: "${widget.cartItems.first.quantity}",
      couponCode: '',
    );

    ref.read(applyCouponNotifier.notifier).applyCoupon(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: () {
            //  displayMessage(context: context, message:'A reset token has been sent to your registered mail');
            // context.hideOverLay();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckoutScreen(
                  cartItems: widget.cartItems,
                ),
              ),
            );
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice =
        widget.cartItems.fold(0, (sum, item) => sum + item.price!);
    final isLoading = ref.watch(
      applyCouponNotifier.select((v) => v.applyCouponState.isLoading),
    );
    //widget.cartItems.first.price;
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Column(
                  children: List.generate(widget.cartItems.length, (index) {
                    final data = widget.cartItems[index];
                    return CartItemCard(
                      image: '${data.product?.cloudinaryUrls?.first}',
                      itemName: '${data.product?.name}',
                      itemAmount: '${data.price}',
                      id: data.product?.id ?? 0,
                    );
                  }),
                ),
                16.hSpace,
                PromoCodeWidget()
              ],
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height - 750,
          // top: MediaQuery.of(context).size.height - 50,
          // top:  400,
          child: Container(
            height: 96.h,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(24),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryF5FAE6,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.totalWithoutTax,
                      style: context.textTheme.s12w500.copyWith(
                        color: AppColors.primary555F7E,
                      ),
                    ),
                    2.hSpace,
                    Text(
                      'N$totalPrice',
                      style: context.textTheme.s16w700.copyWith(
                        color: AppColors.primarySwatch.shade800,
                      ),
                    )
                  ],
                ),
                24.wSpace,
                Expanded(
                  child: SizedBox(
                    width: 100.w,
                    child: ButtonWidget(
                      text: 'Proceed to Checkout',
                      onTap: () {
                        _applyCoupon();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => CheckoutScreen(
                        //       cartItems: widget.cartItems,
                        //     ),
                        //   ),
                        // );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        isLoading
            ? Positioned(
                bottom: 0,
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: AppColors.primaryColor),
                  child: Text(
                    'Loading...',
                    style: context.textTheme.s16w700.copyWith(
                      color: AppColors.primarySwatch.shade800,
                    ),
                  ),
                ),
              )
            : SizedBox.shrink()
      ],
    );
  }
}
