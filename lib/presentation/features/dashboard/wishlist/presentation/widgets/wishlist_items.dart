import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';
import 'package:hts_plus/core/extensions/overlay_extension.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/show_message.dart';
import 'package:hts_plus/presentation/features/cart/presentation/notifier/delete_cart_notifier.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/data/model/wishlist_model.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/notifer/add_%20to_cart_notifier.dart';

class WishListItems extends ConsumerStatefulWidget {
  WishListItems({super.key, required this.wishListItems});

  final List<WishListModelData> wishListItems;

  @override
  ConsumerState<WishListItems> createState() => _WishListItemsState();
}

class _WishListItemsState extends ConsumerState<WishListItems> {
  void _addToCart() {
    ref.read(addToCartNotifier.notifier).addToCart(
          productId: widget.wishListItems.first.productId!.toInt(),
          quantity: widget.wishListItems.first.quantity!.toInt(),
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
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Column(
            children: List.generate(widget.wishListItems.length, (index) {
              final data = widget.wishListItems[index];
              return WishListCard(
                image: '${data.product?.cloudinaryUrls?.first}',
                itemName: '${data.product?.name}',
                itemAmount: '${data.product?.markupPrice}',
                id: data.product?.id ?? 0,
                onTap: _addToCart,
              );
            }),
          ),
          16.hSpace,
        ],
      ),
    );
  }
}

class WishListCard extends ConsumerStatefulWidget {
  const WishListCard(
      {super.key,
      required this.image,
      required this.onTap,
      required this.itemName,
      required this.id,
      required this.itemAmount});
  final String image;
  final String itemName;
  final String itemAmount;
  final int id;
  final VoidCallback onTap;
  @override
  ConsumerState<WishListCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends ConsumerState<WishListCard> {
  void _deleteCart(productId) {
    ref.read(deleteCartNotifier.notifier).deleteCart(
          productId: productId,
          onError: (error) {
            context.showError(message: error);
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
    // final itemsInCart =
    //     ref.watch(itemQuantityProvider.notifier).getQuantity('${widget.id}');
    // final quantity = ref.watch(itemQuantityProvider)[widget.id] ?? 1;
    // final loadState =
    //     ref.watch(deleteCartNotifier.select((v) => v.deleteCartState));
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.secondarySwatch.shade50,
                     backgroundImage: NetworkImage(widget.image),
                  ),
                  18.wSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.itemName,
                        style: context.textTheme.s13w500
                            .copyWith(color: AppColors.primarySwatch.shade900),
                      ),
                      10.hSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'N${widget.itemAmount}',
                            style: context.textTheme.s14w700
                                .copyWith(color: AppColors.primaryColor),
                          ),
                          130.wSpace,
                          Row(
                            children: [
                              Container(
                                //height: 23.h,
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: GestureDetector(
                                    onTap: widget.onTap,
                                    child: Icon(Icons.add,
                                        color: AppColors.white)),
                              ),
                              10.wSpace,
                              GestureDetector(
                                onTap: () {
                                  //   ref.watch(deleteCartNotifier.notifier)
                                  _deleteCart(widget.id);
                                },
                                child: Icon(Icons.delete_outline_outlined,
                                    color: AppColors.red),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        // loadState.isLoading
        //     ? Padding(
        //         padding: const EdgeInsets.all(4),
        //         child: CircularProgressIndicator(
        //           color: AppColors.primaryColor,
        //         ),
        //       )
        //     : SizedBox.shrink()
      ],
    );
  }
}
