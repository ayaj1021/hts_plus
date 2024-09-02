import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/presentation/features/stores/data/model/get_all_stores_model.dart';
import 'package:hts_plus/presentation/features/stores/presentation/view/stores_details_page.dart';

class StoresListSection extends ConsumerStatefulWidget {
  StoresListSection({super.key, required this.filteredItems});

  final List<GetAllStoresData> filteredItems;

  @override
  ConsumerState<StoresListSection> createState() => _StoresListSectionState();
}

class _StoresListSectionState extends ConsumerState<StoresListSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          //700.h,
          MediaQuery.of(context).size.width,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
        ),
        itemCount: widget.filteredItems.length,
        itemBuilder: (context, index) {
          final data = widget.filteredItems[index];
          return GestureDetector(
            onTap: () {
              // context.pushNamed(StoreDetailsPage.routeName);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => StoreDetailsPage(
                            storeId: '${widget.filteredItems[index].id}',
                            image:
                                '${widget.filteredItems[index].cloudinaryUrls?.first}',
                            filteredItems: widget.filteredItems,
                          )));
            },
            child: Container(
              height: 174.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primaryColor)),
              child: Column(
                children: [
                  Container(
                    height: 120.h,
                    width: 181.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      //border: Border.all(color: AppColors.primaryColor),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      child: Image.asset(
                        superMarketList[index]['image'],
                        //   widget.filteredItems[index].cloudinaryUrls![index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  5.hSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.primaryColor),
                          ),
                          child: Image.network(
                            data.cloudinaryUrls?.first ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                        5.wSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.filteredItems[index].name ?? '',
                              style: context.textTheme.s11w500.copyWith(
                                color: AppColors.primarySwatch.shade900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '4.5',
                                  style: context.textTheme.s9w400.copyWith(
                                    color: AppColors.primaryB1B5C4,
                                  ),
                                ),
                                3.wSpace,
                                Row(
                                    children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: AppColors.secondarySwatch.shade400,
                                    size: 12,
                                  );
                                }))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class StoresContainerWidget extends StatelessWidget {
  const StoresContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

final List<Map<String, dynamic>> superMarketList = [
  {
    'image': 'assets/images/hts_plus_market_image.png',
    'title': 'Delizz Supermarket',
    'logo': 'assets/images/deliz.png'
  },
  {
    'image': 'assets/images/paygreens_market.png',
    'title': 'Pay Greens',
    'logo': 'assets/images/paygreens.png'
  },
  {
    'image': 'assets/images/spar_market_image.png',
    'title': 'Spar Supermarket',
    'logo': 'assets/images/spar.png'
  },
  {
    'image': 'assets/images/4u_market_image.png',
    'title': '4U Supermarket',
    'logo': 'assets/images/4u.png'
  },
  {
    'image': 'assets/images/hts_plus_market_image.png',
    'title': '4U H-Medix',
    'logo': 'assets/images/paygreens.png'
  },
  {
    'image': 'assets/images/hmedix_market_image.png',
    'title': 'HTS Plus Mart',
    'logo': 'assets/images/prince.png'
  },
  {
    'image': 'assets/images/paygreens_market.png',
    'title': 'Prince Ebeano',
    'logo': 'assets/images/deliz.png'
  },
  {
    'image': 'assets/images/spar_market_image.png',
    'title': 'Shoprite',
    'logo': 'assets/images/4u.png'
  },
];
