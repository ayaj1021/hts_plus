import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/all_products/presentation/widgets/all_products_appbar.dart';
import 'package:hts_plus/presentation/features/cart/presentation/view/cart_screen.dart';
import 'package:hts_plus/presentation/features/store_products/data/model/get_all_store_products_model.dart';
import 'package:hts_plus/presentation/features/store_products/presentation/notifier/get_all_store_products_notifier.dart';
import 'package:hts_plus/presentation/features/store_products/presentation/widgets/all_store_product_section.dart';
import 'package:hts_plus/presentation/general_widgets/search_text_field.dart';

class AllStoreProductsScreen extends ConsumerStatefulWidget {
  const AllStoreProductsScreen({super.key, required this.storeId});
  static const routeName = '/allStoreProductsScreen';
  final String storeId;

  @override
  ConsumerState<AllStoreProductsScreen> createState() =>
      _AllProductsScreenState();
}

class _AllProductsScreenState extends ConsumerState<AllStoreProductsScreen> {
  final _searchController = TextEditingController();

  List<GetAllStoreProductsData> _filteredItems = [];
  List<GetAllStoreProductsData> getAllStoreProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = getAllStoreProducts;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Fetch all stores and update the state accordingly.
      await ref
          .read(getAllStoreProductsNotifier.notifier)
          .getAllStoreProducts(storeId: widget.storeId);
      setState(() {
        getAllStoreProducts = ref.watch(getAllStoreProductsNotifier
            .select((v) => v.getAllStoresProductsData));
        _filteredItems = getAllStoreProducts;
      });
    });
  }

  void _filterItems(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredItems = getAllStoreProducts;
      });
    } else {
      setState(() {
        _filteredItems = getAllStoreProducts
            .where((market) =>
                market.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loadState =
        ref.watch(getAllStoreProductsNotifier.select((v) => v.loadState));
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
          child: Column(
            children: [
              AllProductsAppBar(),
              20.hSpace,
              SizedBox(
                child: SearchTextField(
                  hintText: 'Search Product',
                  controller: _searchController,
                  onChanged: _filterItems,
                ),
              ),
              19.hSpace,
              SizedBox(
                  child: switch (loadState) {
                LoadState.loading => Center(child: CircularProgressIndicator()),
                LoadState.error => Text('Error'),
                _ => AllStoreProductsSection(
                    filteredItems: _filteredItems,
                  ),
              }),
            ],
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primarySwatch.shade100,
        onPressed: () {
          context.pushNamed(CartScreen.routeName);
        },
        child: SvgPicture.asset('assets/icons/cart_icon.svg'),
      ),
    );
  }
}
