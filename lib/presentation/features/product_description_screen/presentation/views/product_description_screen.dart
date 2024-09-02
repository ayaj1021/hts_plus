import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/extensions/overlay_extension.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/core/utils/show_message.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/notifer/add_%20to_cart_notifier.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/notifer/add_to_cart_quantity_notifier.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/notifer/get_products_by_id_notifier.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/widgets/add_to_cart_icon_button.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/widgets/customer_viewed_section.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/widgets/product_description_appbar.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/widgets/product_image_section.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/widgets/you_may_also_like_section.dart';

class ProductDescriptionScreen extends ConsumerStatefulWidget {
  const ProductDescriptionScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ProductDescriptionScreen> createState() =>
      _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState
    extends ConsumerState<ProductDescriptionScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref
          .read(getProductsByIdNotifier.notifier)
          .getProductsById(id: '${widget.id}');
    });
    super.initState();
  }

  void _addToCart(productId, quantity) {
    ref.read(addToCartNotifier.notifier).addToCart(
          productId: productId,
          quantity: quantity,
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
    final product =
        ref.watch(getProductsByIdNotifier.select((v) => v.getProductsByIdData));
    final loadState =
        ref.watch(getProductsByIdNotifier.select((v) => v.loadState));
    final quantity = ref.watch(quantityProvider);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                  child: switch (loadState) {
                LoadState.loading => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      400.hSpace,
                      Center(child: CircularProgressIndicator()),
                    ],
                  ),
                LoadState.error => Text('Error'),
                _ => Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                        child: ProductsDescriptionAppBar(),
                      ),
                      5.hSpace,
                      Stack(
                        children: [
                          ProductImageSection(
                            items: product,
                          ),
                          Positioned(
                            bottom: 50,
                            top: 60,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                                ref.read(quantityProvider.notifier).state++;
                                // ref
                                //     .read(itemQuantityProvider.notifier)
                                //     .increaseQuantity(product.id.toString());

                                _addToCart(product.id, quantity);
                              },
                              child: Container(
                                height: 50.h,
                                width: 50.w,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryColor,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      5.hSpace,
                      Container(
                        height: 10,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primarySwatch.shade50,
                        ),
                      ),
                      10.hSpace,
                      CustomerViewedSection(),
                      16.hSpace,
                      Container(
                        height: 10,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primarySwatch.shade50,
                        ),
                      ),
                      10.hSpace,
                      YouMayAlsoLikeSection(),
                      20.hSpace,
                    ],
                  ),
              }),
            ),
            Positioned(
                bottom: 0,
                child: switch (loadState) {
                  LoadState.loading => Text(''),
                  LoadState.error => Text('Error'),
                  _ => AddToCartIconButton(
                      productId: product.id ?? 0,
                      quantity: quantity,
                    ),
                }),
          ],
        ),
      ),
    );
  }
}
