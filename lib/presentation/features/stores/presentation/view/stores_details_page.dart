import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/presentation/features/categories/presentation/notifier/get_category_notifer.dart';
import 'package:hts_plus/presentation/features/stores/data/model/get_all_stores_model.dart';
import 'package:hts_plus/presentation/features/stores/presentation/view/products_section.dart';
import 'package:hts_plus/presentation/features/dashboard/home/presentation/widgets/home_appbar.dart';
import 'package:hts_plus/presentation/features/stores/presentation/widgets/home_background.dart';

class StoreDetailsPage extends ConsumerStatefulWidget {
  const StoreDetailsPage(  {super.key, required this.storeId, required this.image , required this.filteredItems,});
  static const routeName = '/storeDetailsPage';
  final String storeId;
  final String image;
   final List<GetAllStoresData> filteredItems;

  @override
  ConsumerState<StoreDetailsPage> createState() => _StoreDetailsPageState();
}

class _StoreDetailsPageState extends ConsumerState<StoreDetailsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(getAllCategoryNotifier.notifier).getAllCategory();
      // setState(() {
      //   getAllCategory = ref
      //       .watch(getAllCategoryNotifier.select((v) => v.getAllCategoryData));
      //   _filteredItems = getAllCategory;
      // });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                StoreDetailsBackground(),
                Column(
                  children: [
                    StoresDetailsAppBar(image: widget.image, filteredItems: widget.filteredItems,),
                    54.hSpace,
                    ProductsSection(storeId: widget.storeId,),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
