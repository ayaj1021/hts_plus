import 'package:flutter/material.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/data/model/wishlist_model.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/presentation/widgets/wishlist_items.dart';

class UnEmptyWishListSection extends StatelessWidget {
  const UnEmptyWishListSection({super.key, required this.wishListItems});
  final List<WishListModelData> wishListItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: WishListItems(
          wishListItems: wishListItems,
        ));
  }


  
}
