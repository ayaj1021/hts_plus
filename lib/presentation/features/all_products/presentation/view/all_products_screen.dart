import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/all_products/data/model/get_all_products_model.dart';
import 'package:hts_plus/presentation/features/all_products/presentation/notifier/get_all_products_notifier.dart';
import 'package:hts_plus/presentation/features/all_products/presentation/widgets/all_products_appbar.dart';
import 'package:hts_plus/presentation/features/all_products/presentation/widgets/all_products_section.dart';
import 'package:hts_plus/presentation/features/cart/data/model/get_cart_model.dart';
import 'package:hts_plus/presentation/features/cart/presentation/notifier/get_cart_notifier.dart';
import 'package:hts_plus/presentation/features/cart/presentation/view/cart_screen.dart';
import 'package:hts_plus/presentation/general_widgets/search_text_field.dart';

class AllProductsScreen extends ConsumerStatefulWidget {
  const AllProductsScreen({super.key});
  static const routeName = '/allProductsScreen';

  @override
  ConsumerState<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends ConsumerState<AllProductsScreen> {
  final _searchController = TextEditingController();

  List<GetAllProductsData> _filteredItems = [];
  List<GetAllProductsData> getAllProducts = [];
  List<GetCartData> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = getAllProducts;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Fetch all stores and update the state accordingly.
      await ref.read(getAllProductsNotifier.notifier).getAllProducts();
      setState(() {
        ref.watch(getCartNotifier.select((v) => v.getCartData));

        getAllProducts = ref
            .watch(getAllProductsNotifier.select((v) => v.getAllProductsData));
        _filteredItems = getAllProducts;
      });
    });
  }

  void _filterItems(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredItems = getAllProducts;
      });
    } else {
      setState(() {
        _filteredItems = getAllProducts
            .where((market) =>
                market.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _cartItems = ref.watch(getCartNotifier.select((v) => v.getCartData));
    final loadState =
        ref.watch(getAllProductsNotifier.select((v) => v.loadState));
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
                _ => AllProductsSection(
                    filteredItems: _filteredItems,
                  ),
              }),
            ],
          ),
        ),
      )),
      floatingActionButton: Stack(
        children: [
          FloatingActionButton(
            backgroundColor: AppColors.primarySwatch.shade100,
            onPressed: () {
              context.pushNamed(CartScreen.routeName);
            },
            child: SvgPicture.asset('assets/icons/cart_icon.svg'),
          ),
          _cartItems.length == 0
              ? SizedBox.shrink()
              : Positioned(
                  right: 0,
                  top: 0,
                  bottom: 20,
                  child: Container(
                    height: 34,
                    width: 34,
                    alignment: Alignment.center,
                    //  padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.red,
                    ),
                    child: Text(
                      '${_cartItems.length}',
                      style: context.textTheme.s16w700.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
