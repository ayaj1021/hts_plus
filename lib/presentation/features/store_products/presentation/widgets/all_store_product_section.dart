import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/views/product_description_screen.dart';
import 'package:hts_plus/presentation/features/store_products/data/model/get_all_store_products_model.dart';

class AllStoreProductsSection extends ConsumerStatefulWidget {
  AllStoreProductsSection({super.key, required this.filteredItems});

  final List<GetAllStoreProductsData> filteredItems;
  @override
  ConsumerState<AllStoreProductsSection> createState() => _AllProductsSectionState();
}

class _AllProductsSectionState extends ConsumerState<AllStoreProductsSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            mainAxisExtent: 300,
          ),
          itemCount: widget.filteredItems.length,
          itemBuilder: (_, index) {
            final data = widget.filteredItems[index];
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDescriptionScreen(
                  
                   id: '${data.id}',
                  ),
                ),
              ),
              child: ProductsContainer(
                image: '${data.cloudinaryUrls!.first}',
                amount: '${data.productPrice}',
                title: '${data.name}',
                initialAmount: '${data.productPrice}',
                discount: '${'0'}',
              ),
            );
          }),
    );
  }
}

class ProductsContainer extends ConsumerWidget {
  const ProductsContainer(
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
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(right: 16),
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
            height: 96.h,
            width: 69.w,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 108.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'N$amount',
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
                    SizedBox(
                      child: Text(
                        discount,
                        style: context.textTheme.s12w400.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                        overflow: TextOverflow.ellipsis,
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

final List products = [
  {
    'image': 'assets/images/best_deals_image_one.png',
    'title': 'Bell Pepper Nutellakarmen lopu...',
    'amount': 'N27,000',
    'initialAmount': 'N30,000',
    'discount': '52% Off',
  },
  {
    'image': 'assets/images/best_deals_image_two.png',
    'title': 'Bell Pepper Nutellakarmen lopu...',
    'amount': 'N27,000',
    'initialAmount': 'N30,000',
    'discount': '52% Off',
  },
  {
    'image': 'assets/images/best_deals_image_three.png',
    'title': 'Bell Pepper Nutellakarmen lopu...',
    'amount': 'N27,000',
    'initialAmount': 'N30,000',
    'discount': '52% Off',
  },
  {
    'image': 'assets/images/best_deals_image_four.png',
    'title': 'Bell Pepper Nutellakarmen lopu...',
    'amount': 'N27,000',
    'initialAmount': 'N30,000',
    'discount': '52% Off',
  },
  {
    'image': 'assets/images/best_deals_image_two.png',
    'title': 'Bell Pepper Nutellakarmen lopu...',
    'amount': 'N27,000',
    'initialAmount': 'N30,000',
    'discount': '52% Off',
  },
  {
    'image': 'assets/images/best_deals_image_one.png',
    'title': 'Bell Pepper Nutellakarmen lopu...',
    'amount': 'N27,000',
    'initialAmount': 'N30,000',
    'discount': '52% Off',
  },
];
