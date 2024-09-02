import 'package:flutter/material.dart';
import 'package:hts_plus/presentation/features/categories/data/model/get_all_categories_model.dart';
import 'package:hts_plus/presentation/features/categories/presentation/widgets/category_container_widget.dart';

class CategoryListSection extends StatelessWidget {
  const CategoryListSection({super.key, required this.filteredItems});
  final List<GetAllCategoriesData> filteredItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
       
          MediaQuery.of(context).size.height,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 14,
          crossAxisSpacing: 8,
          mainAxisExtent: 160
        ),
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          final data = filteredItems[index];
          final imageUrl = (data.cloudinaryUrls != null &&
                  data.cloudinaryUrls!.isNotEmpty)
              ? data.cloudinaryUrls!.first
              : 'assets/logo/hts_plus_logo.png';

          return GestureDetector(
            onTap: () {
              // context.pushNamed(StoreDetailsPage.routeName);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (_) => AllStoreProductsScreen(
              //               storeId: '${widget.filteredItems[index].id}',
              //             )));
            },
            child: CategoryContainer(
              image: imageUrl,
              name: '${data.name}',
            ),
          );
        },
      ),
    );
  }
}
