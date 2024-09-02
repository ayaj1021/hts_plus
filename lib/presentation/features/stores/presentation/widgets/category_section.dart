import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/presentation/features/categories/data/model/get_all_categories_model.dart';
import 'package:hts_plus/presentation/features/categories/presentation/widgets/category_container_widget.dart';

class CategorySection extends ConsumerStatefulWidget {
  const CategorySection({super.key, required this.filteredItem});

  final List<GetAllCategoriesData> filteredItem;
  @override
  ConsumerState<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends ConsumerState<CategorySection> {
  List<GetAllCategoriesData> getAllCategory = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     
        14.hSpace,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              widget.filteredItem.length,
              (index) {
                final data = widget.filteredItem[index];
                return CategoryContainer(
                  image: '',
                  //data.cloudinaryUrls?.first ?? '',

                  name: "${data.name}",
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}


final List categoryItems = [
  {'image': 'assets/images/category_image_one.png', 'title': 'Vegetables'},
  {'image': 'assets/images/category_image_two.png', 'title': 'Fruits'},
  {'image': 'assets/images/category_image_three.png', 'title': 'Beverages'},
  {'image': 'assets/images/category_image_four.png', 'title': 'Edible Oil'},
];
