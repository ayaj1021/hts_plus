import 'package:flutter/material.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/presentation/features/login_options/presentation/widgets/login_options_appbar.dart';
import 'package:hts_plus/presentation/features/login_options/presentation/widgets/login_options_section.dart';

class LoginOptionScreen extends StatelessWidget {
  const LoginOptionScreen({super.key});
  static const routeName = '/loginOptionScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/login_option_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      LoginOptionsAppBar(),
                      250.hSpace,
                      LoginOptionsSection(),
                    
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
