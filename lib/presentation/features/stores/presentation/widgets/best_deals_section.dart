import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/extensions/overlay_extension.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/show_message.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/presentation/notifier/add_to_wishlist_notifier.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/views/product_description_screen.dart';
import 'package:hts_plus/presentation/features/store_products/data/model/get_all_store_products_model.dart';

class BestDealsSection extends ConsumerStatefulWidget {
  const BestDealsSection({super.key, required this.getAllStoreProducts});
  final List<GetAllStoreProductsData> getAllStoreProducts;

  @override
  ConsumerState<BestDealsSection> createState() => _BestDealsSectionState();
}

class _BestDealsSectionState extends ConsumerState<BestDealsSection> {
  void _addToWishList() {
    ref.read(addToWishListNotifier.notifier).addToWishList(
          productId: widget.getAllStoreProducts.first.id!.toInt(),
          quantity: widget.getAllStoreProducts.first.quantity!.toInt(),
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: () {
            displayMessage(
              context: context,
              message: 'Item added to wishlist',
              isError: false,
            );
            context..hideOverLay();
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    final isWishListAdd = ref.watch(addToWishListNotifier);
    return Column(
      children: [
        14.hSpace,
        widget.getAllStoreProducts.isEmpty
            ? Text(
                'Store has no product yet',
                style: context.textTheme.s16w600.copyWith(
                  color: AppColors.primaryColor,
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                  widget.getAllStoreProducts.length,
                  (index) {
                    final data = widget.getAllStoreProducts[index];
                    return BestDealsContainer(
                      addToWishTap: () {
                        _addToWishList();
                      },
                      productTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDescriptionScreen(
                            id: "${data.id}",
                          ),
                        ),
                      ),
                      image: data.cloudinaryUrls?.first ?? '',
                      amount: data.productPrice.toString(),
                      title: '${data.name}',
                      initialAmount: '${data.productPrice}',
                      discount: '${data.discountPrice ?? ''}',
                      favoriteIcon: isWishListAdd.isAdded
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                    );
                  },
                )),
              ),
      ],
    );
  }
}

class BestDealsContainer extends StatelessWidget {
  const BestDealsContainer({
    super.key,
    required this.image,
    required this.amount,
    required this.title,
    required this.initialAmount,
    required this.discount,
    required this.productTap,
    required this.favoriteIcon,
    required this.addToWishTap,
  });
  final String image;
  final String amount;
  final String initialAmount;
  final String title;
  final IconData favoriteIcon;
  final String discount;

  final VoidCallback productTap;
  final VoidCallback addToWishTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: productTap,
          child: Container(
            margin: EdgeInsets.only(right: 16),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              border: Border.all(
                color: AppColors.primarySwatch.shade100,
                width: 2,
              ),
            ),
            child: Column(
              children: [
                5.hSpace,
                SizedBox(
                  height: 96.h,
                  width: 69.w,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 104.w,
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
                  ),
                )
              ],
            ),
          ),
        ),
        Column(
          children: [
            Container(
              height: 34.h,
              width: 34.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                ),
                color: AppColors.secondarySwatch.shade100,
              ),
              child: Text(
                '52% Off',
                style: context.textTheme.s8w700.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          right: 20,
          top: 10,
          child: GestureDetector(
            onTap: addToWishTap,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: AppColors.primaryFBE8E8, shape: BoxShape.circle),
              child: Icon(
                favoriteIcon,
                color: AppColors.primaryD21C1C,
                size: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

final List bestDeals = [
  {
    'image': 'assets/images/best_deals_image_one.png',
    'title': 'Bell Pepper Nutellakarmen lopu...',
    'amount': 'N27,000',
    'initialAmount': 'N30,000',
    'discount': '',
  },
  {
    'image': 'assets/images/best_deals_image_two.png',
    'title': 'Bell Pepper Nutellakarmen lopu...',
    'amount': 'N27,000',
    'initialAmount': 'N30,000',
    'discount': '',
  },
  {
    'image': 'assets/images/best_deals_image_one.png',
    'title': 'Bell Pepper Nutellakarmen lopu...',
    'amount': 'N27,000',
    'discount': '52% Off',
    'initialAmount': 'N30,000'
  },
];
