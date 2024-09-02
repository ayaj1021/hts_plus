import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/presentation/features/cart/presentation/notifier/get_cart_notifier.dart';
import 'package:hts_plus/presentation/features/cart/presentation/widgets/cart_section.dart';
import 'package:hts_plus/presentation/features/cart/presentation/widgets/cart_screen_app_bar.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  static const routeName = '/cartScreen';

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Fetch all stores and update the state accordingly.
      await ref.read(getCartNotifier.notifier).getCart();

      ref.watch(getCartNotifier.select((v) => v.getCartData));
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
              child: CartScreenAppBar(),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.primarySwatch.shade50,
              ),
              child: CartSection(),
            ),
          ]),
        ),
      ),
    );
  }
}
