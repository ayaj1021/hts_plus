import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';
import 'package:hts_plus/core/extensions/overlay_extension.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/show_message.dart';
import 'package:hts_plus/presentation/features/cart/presentation/notifier/delete_cart_notifier.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/notifer/add_to_cart_quantity_notifier.dart';

class CartItemCard extends ConsumerStatefulWidget {
  const CartItemCard(
      {super.key,
      required this.image,
      required this.itemName,
      required this.id,
      required this.itemAmount});
  final String image;
  final String itemName;
  final String itemAmount;
  final int id;

  @override
  ConsumerState<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends ConsumerState<CartItemCard> {
  void _deleteCart(productId) {
    context.showLoading();
    ref.read(deleteCartNotifier.notifier).deleteCart(
          productId: productId,
          onError: (error) {
            context
              ..hideOverLay()
              ..showError(message: error);
          },
          onSuccess: () {
            displayMessage(
              context: context,
              message: 'Item removed from cart',
              isError: false,
            );

            context
              ..hideOverLay
              ..pop();
            // ..popAndPushNamed(CartScreen.routeName);
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    final itemsInCart =
        ref.watch(itemQuantityProvider.notifier).getQuantity('${widget.id}');
    // final quantity = ref.watch(itemQuantityProvider)[widget.id] ?? 1;
    // final loadState =
    //     ref.watch(deleteCartNotifier.select((v) => v.deleteCartState));
    return Container(
      // alignment: Alignment.center,
      //margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.secondarySwatch.shade50,
                  backgroundImage: NetworkImage(widget.image),
                ),
                18.wSpace,
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.itemName,
                        style: context.textTheme.s13w500
                            .copyWith(color: AppColors.primarySwatch.shade900),
                        // maxLines: 2,
                      ),
                      10.hSpace,
                      Text(
                        'N${widget.itemAmount}',
                        style: context.textTheme.s11w400
                            .copyWith(color: AppColors.primary8F959E),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Icon(Icons.favorite_border,
                      color: AppColors.primaryB0B0B0),
                  10.wSpace,
                  GestureDetector(
                    onTap: () {
                      //   ref.watch(deleteCartNotifier.notifier)
                      _deleteCart(widget.id);
                    },
                    child: const Icon(Icons.delete_outline_outlined,
                        color: AppColors.red),
                  ),
                ],
              ),
              10.hSpace,
              Container(
                //height: 23.h,
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(74),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          ref
                              .read(itemQuantityProvider.notifier)
                              .decreaseQuantity('${widget.id}');
                        },
                        child:
                            const Icon(Icons.remove, color: AppColors.white)),
                    15.wSpace,
                    Text(
                      '$itemsInCart pcs',
                      style: context.textTheme.s11w700
                          .copyWith(color: AppColors.white),
                    ),
                    15.wSpace,
                    GestureDetector(
                        onTap: () {
                          ref
                              .read(itemQuantityProvider.notifier)
                              .increaseQuantity('${widget.id}');
                        },
                        child: const Icon(Icons.add, color: AppColors.white)),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
