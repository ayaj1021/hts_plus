import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/features/stores/data/model/get_all_stores_model.dart';
import 'package:hts_plus/presentation/features/stores/presentation/notifier/get_all_stores_notifier.dart';
import 'package:hts_plus/presentation/features/stores/presentation/widgets/all_products_button.dart';
import 'package:hts_plus/presentation/features/stores/presentation/widgets/store_list_section.dart';
import 'package:hts_plus/presentation/features/stores/presentation/widgets/stores_appbar.dart';
import 'package:hts_plus/presentation/general_widgets/search_text_field.dart';

class StoresScreen extends ConsumerStatefulWidget {
  const StoresScreen({super.key});
  static const routeName = '/storesScreen';

  @override
  ConsumerState<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends ConsumerState<StoresScreen> {
  final _searchController = TextEditingController();
  List<GetAllStoresData> _filteredItems = [];
  List<GetAllStoresData> getAllStores = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = getAllStores;
    // getId();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Fetch all stores and update the state accordingly.
      await ref.read(getAllStoresNotifier.notifier).getAllStores();
      setState(() {
        getAllStores =
            ref.watch(getAllStoresNotifier.select((v) => v.getAllStoresData));
        _filteredItems = getAllStores;
      });
    });
  }

  // Function to filter items based on the query
  void _filterItems(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredItems = getAllStores;
      });
    } else {
      setState(() {
        _filteredItems = getAllStores
            .where((market) =>
                market.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // _filteredItems =
    //     ref.watch(getAllStoresNotifier.select((v) => v.getAllStoresData));
    final loadState =
        ref.watch(getAllStoresNotifier.select((v) => v.loadState));
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StoresAppBar(),
              19.hSpace,
              SearchTextField(
                onChanged: _filterItems,
                hintText: 'Search for a store',
                controller: _searchController,
              ),
              23.hSpace,
              SizedBox(
                  child: switch (loadState) {
                LoadState.loading => Center(child: CircularProgressIndicator()),
                LoadState.error => Text('Error'),
                _ => StoresListSection(
                    filteredItems: _filteredItems,
                  ),
              }),
              30.hSpace,
              Divider(
                color: AppColors.primaryCACDD7,
              ),
              15.hSpace,
              Text(
                Strings.orShopAllProducts,
                style: context.textTheme.s14w400.copyWith(
                  color: AppColors.primary777F98,
                ),
              ),
              10.hSpace,
              AllProductsButton(),
            ],
          ),
        ),
      )),
    );
  }
}
