import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/features/categories/data/model/get_all_categories_model.dart';
import 'package:hts_plus/presentation/features/categories/presentation/notifier/get_category_notifer.dart';
import 'package:hts_plus/presentation/features/categories/presentation/view/category_screen.dart';
import 'package:hts_plus/presentation/features/store_products/data/model/get_all_store_products_model.dart';
import 'package:hts_plus/presentation/features/store_products/presentation/notifier/get_all_store_products_notifier.dart';
import 'package:hts_plus/presentation/features/store_products/presentation/view/store_products_view.dart';
import 'package:hts_plus/presentation/features/stores/presentation/widgets/best_deals_section.dart';
import 'package:hts_plus/presentation/features/stores/presentation/widgets/category_section.dart';
import 'package:hts_plus/presentation/features/stores/presentation/widgets/promo_section.dart';
import 'package:hts_plus/presentation/general_widgets/search_text_field.dart';

class ProductsSection extends ConsumerStatefulWidget {
  const ProductsSection({
    super.key,
    required this.storeId,
  });
  final String storeId;

  @override
  ConsumerState<ProductsSection> createState() => _ProductsSectionState();
}

class _ProductsSectionState extends ConsumerState<ProductsSection> {
  final _searchController = TextEditingController();

  List<GetAllCategoriesData> _filteredItems = [];
  List<GetAllCategoriesData> getAllCategory = [];
  List<GetAllStoreProductsData> getAllStoreProducts = [];
  @override
  void initState() {
    _filteredItems = getAllCategory;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Fetch all stores and update the state accordingly.

      await ref
          .read(getAllStoreProductsNotifier.notifier)
          .getAllStoreProducts(storeId: widget.storeId);

      setState(() {
        getAllStoreProducts = ref.watch(getAllStoreProductsNotifier
            .select((v) => v.getAllStoresProductsData));
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(getAllCategoryNotifier.notifier).getAllCategory();
      setState(() {
        getAllCategory = ref
            .watch(getAllCategoryNotifier.select((v) => v.getAllCategoryData));
        _filteredItems = getAllCategory;
      });
    });
    super.initState();
  }

  void _filterItems(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredItems = getAllCategory;
      });
    } else {
      setState(() {
        _filteredItems = getAllCategory
            .where((market) =>
                market.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loadState =
        ref.watch(getAllCategoryNotifier.select((v) => v.getCategoryState));

    final bestDealsState =
        ref.watch(getAllStoreProductsNotifier.select((v) => v.loadState));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 38),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          SearchTextField(
            onChanged: _filterItems,
            hintText: 'Search Categories',
            controller: _searchController,
          ),
          // 20.hSpace,
          PromoSection(),
          9.hSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.categories,
                style: context.textTheme.s16w700.copyWith(
                  color: AppColors.primary4D5673,
                ),
              ),
              GestureDetector(
                onTap: () => context.pushNamed(CategoryScreen.routeName),
                child: Text(
                  Strings.seeAll,
                  style: context.textTheme.s14w500.copyWith(
                    color: AppColors.primary249333,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
              child: switch (loadState) {
            LoadState.loading => Center(child: CircularProgressIndicator()),
            LoadState.error => Text('Error'),
            _ => CategorySection(
                filteredItem: _filteredItems,
              ),
          }),
          23.hSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    Strings.bestDeals,
                    style: context.textTheme.s16w700.copyWith(
                      color: AppColors.primary4D5673,
                    ),
                  ),
                  SvgPicture.asset('assets/icons/Fire.svg')
                ],
              ),
              GestureDetector(
                onTap: () =>
                    context.pushNamed<void>(AllStoreProductsScreen.routeName),
                child: Text(
                  Strings.seeAll,
                  style: context.textTheme.s14w500.copyWith(
                    color: AppColors.primary249333,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
              child: switch (bestDealsState) {
            LoadState.loading => Center(child: CircularProgressIndicator()),
            LoadState.error => Text('Error'),
            _ => BestDealsSection(
                getAllStoreProducts: getAllStoreProducts,
              ),
          }),
        ],
      ),
    );
  }
}
