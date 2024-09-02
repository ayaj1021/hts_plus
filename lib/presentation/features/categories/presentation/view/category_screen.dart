import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/categories/data/model/get_all_categories_model.dart';
import 'package:hts_plus/presentation/features/categories/presentation/notifier/get_category_notifer.dart';
import 'package:hts_plus/presentation/features/categories/presentation/widgets/category_app_bar.dart';
import 'package:hts_plus/presentation/features/categories/presentation/widgets/category_list_section.dart';
import 'package:hts_plus/presentation/general_widgets/search_text_field.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});
  static const routeName = '/categoryScreen';

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  final _searchController = TextEditingController();

  List<GetAllCategoriesData> _filteredItems = [];
  List<GetAllCategoriesData> getAllCategory = [];
  @override
  void initState() {
    _filteredItems = getAllCategory;
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
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CategoryAppBar(),
              19.hSpace,
              SearchTextField(
                onChanged: _filterItems,
                hintText: 'Search Categories',
                controller: _searchController,
              ),
              20.hSpace,
              SizedBox(
                  child: switch (loadState) {
                LoadState.loading => Center(child: CircularProgressIndicator()),
                LoadState.error => Text('Error'),
                _ => CategoryListSection(
                    filteredItems: _filteredItems,
                  )
              })
            ],
          ),
        ),
      )),
    );
  }
}
