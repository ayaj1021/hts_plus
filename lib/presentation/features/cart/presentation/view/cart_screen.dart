import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/extensions/overlay_extension.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/features/cart/data/model/get_cart_model.dart';
import 'package:hts_plus/presentation/features/cart/presentation/notifier/get_cart_notifier.dart';
import 'package:hts_plus/presentation/features/cart/presentation/widgets/cart_section.dart';
import 'package:hts_plus/presentation/features/cart/presentation/widgets/cart_screen_app_bar.dart';
import 'package:hts_plus/presentation/features/checkout/data/model/apply_coupon_request.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/notifier/apply_coupon_notifier.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/view/checkout_screen.dart';
import 'package:hts_plus/presentation/general_widgets/app_button.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  static const routeName = '/cartScreen';

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  late List<GetCartData> cartItems;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Fetch all stores and update the state accordingly.
      await ref.read(getCartNotifier.notifier).getCart();
      setState(() {
        cartItems = ref.watch(getCartNotifier.select((v) => v.getCartData));
      });
    });

    super.initState();
  }

  void _applyCoupon() {
    final data = ApplyCouponRequest(
      productId: "${cartItems.first.productId}",
      quantity: "${cartItems.first.quantity}",
      couponCode: '',
    );

    ref.read(applyCouponNotifier.notifier).applyCoupon(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: () {
            //  displayMessage(context: context, message:'A reset token has been sent to your registered mail');
            // context.hideOverLay();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckoutScreen(
                  cartItems: cartItems,
                ),
              ),
            );
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(getCartNotifier.select((v) => v.getCartData));
    final totalPrice = items.fold(0, (sum, item) => sum + item.price!);

    return Theme(
      data: Theme.of(context).copyWith(
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      child: Scaffold(
        persistentFooterButtons: [
          if (items.isNotEmpty)
            CheckOutContainer(
              totalPrice: "$totalPrice",
              onTap: () {
                _applyCoupon();
              },
            ),
        ],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: CartScreenAppBar(),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.primarySwatch.shade50,
                ),
                child: const CartSection(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class CheckOutContainer extends StatelessWidget {
  const CheckOutContainer({
    super.key,
    required this.totalPrice,
    required this.onTap,
  });

  final String totalPrice;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 96.h,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(24),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.primaryF5FAE6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.totalWithoutTax,
                style: context.textTheme.s12w500.copyWith(
                  color: AppColors.primary555F7E,
                ),
              ),
              2.hSpace,
              Text(
                'N$totalPrice',
                style: context.textTheme.s16w700.copyWith(
                  color: AppColors.primarySwatch.shade800,
                ),
              )
            ],
          ),
          24.wSpace,
          Expanded(
            child: SizedBox(
              width: 100.w,
              child: ButtonWidget(text: 'Proceed to Checkout', onTap: onTap

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => CheckoutScreen(
                  //       cartItems: widget.cartItems,
                  //     ),
                  //   ),
                  // );

                  ),
            ),
          ),
        ],
      ),
    );
  }
}


//  Container(
//             height: 96.h,
//             width: MediaQuery.of(context).size.width,
//             padding: const EdgeInsets.all(24),
//             alignment: Alignment.center,
//             decoration: const BoxDecoration(
//               color: AppColors.primaryF5FAE6,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       Strings.totalWithoutTax,
//                       style: context.textTheme.s12w500.copyWith(
//                         color: AppColors.primary555F7E,
//                       ),
//                     ),
//                     2.hSpace,
//                     Text(
//                       'N$totalPrice',
//                       style: context.textTheme.s16w700.copyWith(
//                         color: AppColors.primarySwatch.shade800,
//                       ),
//                     )
//                   ],
//                 ),
//                 24.wSpace,
//                 Expanded(
//                   child: SizedBox(
//                     width: 100.w,
//                     child: ButtonWidget(
//                       text: 'Proceed to Checkout',
//                       onTap: () {
//                         _applyCoupon();
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => CheckoutScreen(
//                         //       cartItems: widget.cartItems,
//                         //     ),
//                         //   ),
//                         // );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
       
       