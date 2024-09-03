import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/extensions/overlay_extension.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/core/utils/show_message.dart';
import 'package:hts_plus/presentation/features/cart/data/model/get_cart_model.dart';
import 'package:hts_plus/presentation/features/cart/presentation/notifier/get_cart_notifier.dart';
import 'package:hts_plus/presentation/features/checkout/data/model/check_out_request.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/notifier/check_out_notifier.dart';
import 'package:hts_plus/presentation/features/dashboard/widgets/dashboard.dart';
import 'package:hts_plus/presentation/general_widgets/app_button.dart';

class PaymentSuccessPage extends ConsumerStatefulWidget {
  const PaymentSuccessPage({
    super.key,
    required this.successMessage,
    required this.reference,
  });
  final String successMessage;
  final String reference;

  @override
  ConsumerState<PaymentSuccessPage> createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends ConsumerState<PaymentSuccessPage> {
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

  void _checkOut() async {
    final data = CheckOutRequest(
      productId: "${cartItems.first.productId}",
      quantity: "${cartItems.first.quantity}",
      couponCode: '',
      reference: widget.reference,
      orderNote: '',
      orderType: 'In-app',
      paymentType: 'card',
      isNewCustomer: false,
    );

    ref.read(checkOutNotifier.notifier).checkOut(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: () {
             displayMessage(context: context, message:'Your order is being processed');
            // context.hideOverLay();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DashBoard(),
              ),
            );
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Image.network(
                      "https://res.cloudinary.com/iamvictorsam/image/upload/v1671834054/Capture_inlcff.png",
                      height: MediaQuery.of(context).size.height * 0.4, //40%
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    const Text('Payment Successful',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    const Spacer(),
                    Consumer(builder: (context, re, c) {
                      final isLoading = re.watch(
                        checkOutNotifier
                            .select((v) => v.applyCouponState.isLoading),
                      );
                      return ButtonWidget(
                        isEnabled: re.watch(
                              checkOutNotifier.select((v) => v.inputValid),
                            ) &&
                            !isLoading,
                        isLoading: isLoading,
                        onTap: () {
                          _checkOut();
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const CheckoutPage()));
                        },
                        text: 'Continue Shopping',
                      );
                    }),
                    const Spacer(),
                  ],
                ))));
  }
}
