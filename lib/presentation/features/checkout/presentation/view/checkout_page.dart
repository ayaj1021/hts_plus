import 'package:flutter/material.dart';
import 'package:hts_plus/presentation/features/checkout/presentation/view/payment_success_page.dart';

import 'package:flutter_paystack/flutter_paystack.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final amountController = TextEditingController();

  //////// --> copy from here
  String publicKey = 'sk_test_0fc9e261ff1b0d8eb95cb890c3106b9d4cfb3117';
  final plugin = PaystackPlugin();
  String successMessage = '';

  @override
  void initState() {
    super.initState();
    plugin.initialize(publicKey: publicKey);
  }

  checkout() async {
    int price = int.parse(amountController.text) * 100;
    Charge charge = Charge()
      ..amount = price
      ..reference = 'ref_${DateTime.now().millisecondsSinceEpoch}'
      //   ..email = emailController.text
      ..currency = "NGN";
    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge,
    );
    print(response);
    if (response.status == true) {
      print(response);
      successMessage = 'Payment was successful. Ref: ${response.reference}';
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PaymentSuccessPage(successMessage: successMessage)),
      );
    } else {
      print(response.message);
    }
  }
  //////// --> to here

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
