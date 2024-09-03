import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/database/database.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/features/cart/data/model/get_cart_model.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/view/payment_success_page.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/widgets/add_coupon_code_section.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/widgets/delivery_address_section.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/widgets/delivery_instruction_section.dart';
import 'package:hts_plus/presentation/features/cart/presentation/widgets/order_summary_section.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/widgets/total_amount_section.dart';
import 'package:hts_plus/presentation/general_widgets/app_button.dart';

class CheckOutSection extends ConsumerStatefulWidget {
  const CheckOutSection(
      {super.key, required this.cartItems, required this.totalAmount});
  final List<GetCartData> cartItems;
  final String totalAmount;

  @override
  ConsumerState<CheckOutSection> createState() => _CheckOutState();
}

class _CheckOutState extends ConsumerState<CheckOutSection> {
  final amountController = TextEditingController();
  String publicKey = 'pk_test_a539b27ed3025dfe2bed667fe7e4f771aec5032c';
  final plugin = PaystackPlugin();
  String successMessage = '';

  @override
  void initState() {
    super.initState();
    plugin.initialize(publicKey: publicKey);
  }

  checkout() async {
    // int? price = int.tryParse(amountController.text) * 100;
    int price = int.parse(widget.totalAmount) * 100;

    final storage = SecureStorage();
    final email = await storage.getUserEmail();
    log('$email');
    Charge charge = Charge()
      ..amount = price
      ..reference = 'ref_${DateTime.now().millisecondsSinceEpoch}'
      ..email = "$email"
      //emailController.text
      ..currency = "NGN";
    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge,
    );

    if (response.status == true) {
      successMessage = 'Payment was successful. Ref: ${response.reference}';
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              PaymentSuccessPage(successMessage: successMessage, reference: '${response.reference}',),
        ),
      );
    } else {
      print(response.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderSummarySection(widget: widget),
          8.hSpace,
          const DeliveryAddressSection(),
          10.hSpace,
          const DeliveryInstructionSection(),
          10.hSpace,
          const AddCouponCodeSection(),
          10.hSpace,
          TotalAmountSection(
            totalAmount: widget.totalAmount,
          ),
          10.hSpace,
          ButtonWidget(
            text: 'Checkout',
            onTap: () {
              checkoutAlertDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> checkoutAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              height: 230.h,
              width: double.infinity,
              padding: const EdgeInsets.only(
                bottom: 28,
                top: 30,
                right: 20,
                left: 20,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    Strings.confirmYourOrder,
                    style: context.textTheme.s18w700.copyWith(
                      color: AppColors.primarySwatch.shade900,
                    ),
                  ),
                  8.hSpace,
                  Text(
                    Strings.areYouUserYouWantToConfirm,
                    style: context.textTheme.s12w400.copyWith(
                      color: AppColors.primarySwatch.shade900,
                    ),
                  ),
                  20.hSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 110.w,
                        child: ButtonWidget(
                          onTap: () {
                            Navigator.pop(context);
                            checkout();
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const PaystackScreen(),
                            //   ),
                            // );
                          },
                          text: 'Yes',
                          buttonColor: AppColors.primaryFF392B,
                        ),
                      ),
                      SizedBox(
                        width: 110.w,
                        child: ButtonWidget(
                          onTap: () => Navigator.pop(context),
                          text: 'No',
                          buttonColor: AppColors.primaryEEEFF2,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
