import 'package:flutter/material.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/presentation/general_widgets/app_button.dart';

import 'checkout_page.dart';

class PaystackScreen extends StatefulWidget {
  const PaystackScreen({Key? key}) : super(key: key);

  @override
  State<PaystackScreen> createState() => _PaystackScreenState();
}

class _PaystackScreenState extends State<PaystackScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Checkout Page')),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            // border:
                            //     Border.all(color: AppColors.primaryColor),
                          ),
                          child: TextFormField(
                            controller: amountController,
                            // autovalidateMode:
                            //     AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter amount';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                prefix: Text('₦',
                                    style: TextStyle(color: AppColors.green)),
                                hintText: '2000',
                                labelText: 'Amount',
                                border: InputBorder.none),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            // border:
                            //     Border.all(color: AppColors.primaryColor),
                          ),
                          child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              // autovalidateMode:
                              //     AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter email';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  hintText: 'janedoe@who.com',
                                  labelText: 'Email',
                                  border: InputBorder.none)),
                        ),
                        const SizedBox(height: 50),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ButtonWidget(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CheckoutPage()));
                                }
                              },
                              text: 'Proceed to Pay',
                            )),
                      ],
                    )))));
  }
}
