import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/presentation/notifier/get_wishlist_notifier.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/presentation/widgets/wish_list_app_bar.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/presentation/widgets/wishlist_section.dart';

class WishListScreen extends ConsumerStatefulWidget {
  const WishListScreen({super.key});

  static const routeName = '/wishListScreen';

  @override
  ConsumerState<WishListScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<WishListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Fetch all stores and update the state accordingly.
      await ref.read(getWishListNotifier.notifier).getWishList();

      ref.watch(getWishListNotifier.select((v) => v.getWishListData));
    });

    super.initState();
  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: WishListAppBar(),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.primarySwatch.shade50,
              ),
              child: WishListSection(),
            ),
          ]),
        ),
      ),
    );
  }
}
