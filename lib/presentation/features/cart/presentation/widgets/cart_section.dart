import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/cart/data/model/get_cart_model.dart';
import 'package:hts_plus/presentation/features/cart/presentation/notifier/get_cart_notifier.dart';
import 'package:hts_plus/presentation/features/cart/presentation/widgets/empty_cart_text.dart';
import 'package:hts_plus/presentation/features/cart/presentation/widgets/unempty_cart_section.dart';

class CartSection extends ConsumerStatefulWidget {
  const CartSection({super.key});

  @override
  ConsumerState<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends ConsumerState<CartSection> {
  List<GetCartData> _cartItems = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Fetch all stores and update the state accordingly.
      await ref.read(getCartNotifier.notifier).getCart();

      setState(() {
        _cartItems = ref.watch(
          getCartNotifier.select((v) => v.getCartData),
        );
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(getCartNotifier.select((v) => v.getCartData));
    final loadState = ref.watch(getCartNotifier.select((v) => v.loadState));
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: switch (loadState) {
          LoadState.loading => Center(child: CircularProgressIndicator()),
          LoadState.error => Text('Error'),
          _ => SingleChildScrollView(
              child: Column(
                children: [
                  cart.isEmpty
                      ? EmptyCartText()
                      : UnEmptyCartSection(
                          cartItems: _cartItems,
                        ),
                ],
              ),
            ),
        });
  }
}
