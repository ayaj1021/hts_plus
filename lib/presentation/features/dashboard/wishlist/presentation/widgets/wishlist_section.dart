import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/data/model/wishlist_model.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/presentation/notifier/get_wishlist_notifier.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/presentation/widgets/empty_wishlist.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/presentation/widgets/unempty_wishlist_section.dart';

class WishListSection extends ConsumerStatefulWidget {
  const WishListSection({super.key});

  @override
  ConsumerState<WishListSection> createState() => _WishListSectionState();
}

class _WishListSectionState extends ConsumerState<WishListSection> {
  List<WishListModelData> _wishListItems = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Fetch all stores and update the state accordingly.
      await ref.read(getWishListNotifier.notifier).getWishList();

      setState(() {
        _wishListItems =
            ref.watch(getWishListNotifier.select((v) => v.getWishListData));
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final wishList = ref.watch(getWishListNotifier.select((v) => v.getWishListData));
    final loadState = ref.watch(getWishListNotifier.select((v) => v.loadState));
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: switch (loadState) {
          LoadState.loading => Center(child: CircularProgressIndicator()),
          LoadState.error => Text('Error'),
          _ => SingleChildScrollView(
              child: Column(
                children: [
                  wishList.isEmpty
                      ? EmptyWishList()
                      : UnEmptyWishListSection(
                          wishListItems: _wishListItems,
                        ),
                ],
              ),
            ),
        });
  }
}
