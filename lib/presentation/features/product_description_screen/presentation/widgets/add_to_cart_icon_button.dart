import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/extensions/overlay_extension.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/show_message.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/notifer/add_%20to_cart_notifier.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/notifer/add_to_cart_quantity_notifier.dart';

class AddToCartIconButton extends ConsumerStatefulWidget {
  const AddToCartIconButton({
    required this.productId,
    required this.quantity,
    super.key,
  });

  final int productId;
  final int quantity;

  @override
  ConsumerState<AddToCartIconButton> createState() =>
      _AddToCartIconButtonState();
}

class _AddToCartIconButtonState extends ConsumerState<AddToCartIconButton> {
  void _addToCart() async {
    ref.read(quantityProvider.notifier).state++;
    await ref.read(addToCartNotifier.notifier).addToCart(
          productId: widget.productId,
          quantity: widget.quantity,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: () {
            displayMessage(
              context: context,
              message: 'Item added to cart',
              isError: false,
            );
            context..hideOverLay();
            // ..showSuccess(message: 'Item add to cart');
          },
        );
  }

  final bool isLoading = false;
  final bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _addToCart();
        },
        child: Container(
          padding: EdgeInsets.all(24),
          width: MediaQuery.of(context).size.width,
          height: 75.h,
          decoration: BoxDecoration(
            color: AppColors.primarySwatch.shade50,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primarySwatch.shade200,
                child: Icon(Icons.call_outlined),
              ),
              24.wSpace,
              Container(
                alignment: Alignment.center,
                width: 240.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: AppColors.white,
                    ),
                    12.wSpace,
                    Text(
                      'Add to Cart',
                      style: context.textTheme.s14w700.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
