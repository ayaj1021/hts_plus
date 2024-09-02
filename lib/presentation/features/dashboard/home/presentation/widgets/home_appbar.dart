import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/features/cart/presentation/view/cart_screen.dart';
import 'package:hts_plus/presentation/features/stores/data/model/get_all_stores_model.dart';

class StoresDetailsAppBar extends StatelessWidget {
  const StoresDetailsAppBar(
      {super.key, required this.image, required this.filteredItems});
  final String image;
  final List<GetAllStoresData> filteredItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        top: 60,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
            child: Icon(
              Icons.arrow_back,
              color: AppColors.secondaryColor,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            superMarketListBottomSheet(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.white,
                border: Border.all(
                  color: AppColors.primaryCACDD7,
                )),
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.network(image),
                ),
                5.wSpace,
                Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.primary8D94A9,
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => context.pushNamed(CartScreen.routeName),
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
            child: SvgPicture.asset('assets/icons/shopping_bag_icon.svg'),
          ),
        ),
      ]),
    );
  }

  Future<dynamic> superMarketListBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 23,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(17),
                topRight: Radius.circular(17),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      Strings.selectStore,
                      style: context.textTheme.s20w700.copyWith(
                        color: AppColors.primarySwatch.shade700,
                      ),
                    ),
                    95.wSpace,
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(
                            'assets/icons/cancel_icon_red.svg'))
                  ],
                ),
                21.hSpace,
                Column(
                  children: List.generate(
                    filteredItems.length,
                    (index) {
                      final data = filteredItems[index];
                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(data.cloudinaryUrls?.first ?? ''),
                          ),
                          20.wSpace,
                          Text(
                            "${data.name}",
                            style: context.textTheme.s16w600.copyWith(
                              color: AppColors.primary4D5673,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          );
        });
  }
}

final List superMarketList = [
  {'image': 'assets/images/deliz.png', 'title': 'Delizz Supermarket'},
  {'image': 'assets/images/paygreens.png', 'title': 'Pay Greens'},
  {'image': 'assets/images/spar.png', 'title': 'Spar Supermarket'},
  {'image': 'assets/images/4u.png', 'title': '4U Supermarket'},
  {'image': 'assets/images/prince.png', 'title': 'Prince Ebeano'},
];
