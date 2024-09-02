import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/presentation/features/product_description_screen/data/model/get_product_by_id_model.dart';
import 'package:hts_plus/presentation/features/product_description_screen/presentation/widgets/product_description_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImageSection extends StatefulWidget {
  const ProductImageSection({super.key, required this.items});

  final GetProductByIdData items;

  @override
  State<ProductImageSection> createState() => _ProductImageSectionState();
}

class _ProductImageSectionState extends State<ProductImageSection>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  String label = '';

  @override
  Widget build(BuildContext context) {
    RegExp regExp = RegExp(r'"label":"(.*?)"');

    RegExpMatch? match = regExp.firstMatch('${widget.items.state}');
    if (match != null) {
      setState(() {
        label = match.group(1)!;
      });
    } else {
      print('No match found');
    }
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 80),
              decoration: BoxDecoration(color: AppColors.primarySwatch.shade50),
              child: Column(
                children: [
                  SizedBox(
                    height: 250.h,
                    child: PageView(
                      controller: _pageController,
                      children: List.generate(
                          widget.items.cloudinaryUrls?.length ?? 0, (index) {
                        return SizedBox(
                          child: Image.network(
                            widget.items.cloudinaryUrls?[index] ?? '',
                            fit: BoxFit.cover,
                          ),
                        );
                      }),
                    ),
                  ),
                  40.hSpace,
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: widget.items.cloudinaryUrls?.length ?? 0,
                    effect: ExpandingDotsEffect(
                        dotWidth: 7,
                        dotHeight: 6,
                        activeDotColor: AppColors.primaryColor,
                        dotColor: AppColors.primarySwatch.shade200),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: ProductDescriptionWidget(
                productTitle: '${widget.items.name}',
                productAmount: '${widget.items.productPrice}',
                productLocation: '+ shipping from $label  See option',
                productBrand: 'XIAOMI',
                productRating:
                    '${widget.items.averageRating ?? 'No Rating yet'}',
                productReview: '${widget.items.averageRating ?? ''}',
                productDescription: '${widget.items.description}',
                productLogo:
                    '${widget.items.partnerStore?.cloudinaryUrls?[0]}',
                productStoreName: '${widget.items.partnerStore?.name ?? ''}',
              ),
            ),
          ],
        ),
      
      ],
    );
  }
}
