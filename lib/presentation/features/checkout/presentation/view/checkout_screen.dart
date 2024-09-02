import 'package:flutter/material.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/presentation/features/cart/data/model/get_cart_model.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/widgets/checkout_section.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/widgets/checkout_screen_appbar.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.cartItems});
  final List<GetCartData> cartItems;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final totalPrice =
        widget.cartItems.fold(0, (sum, item) => sum + item.price!);
    return Scaffold(
      backgroundColor: AppColors.primarySwatch.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: CheckOutScreenAppBar(),
            ),
            CheckOutSection(
              cartItems: widget.cartItems,
              totalAmount: "$totalPrice",
            ),
          ]),
        ),
      ),
    );
  }
}
