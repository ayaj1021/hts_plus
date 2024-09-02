import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/database/database.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/features/dashboard/widgets/dashboard.dart';
import 'package:hts_plus/presentation/features/onboarding/presentation/pages/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = '/';
 // static const routeName = 'splashScreen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      final storage = await SecureStorage();
      final token = await storage.getUserToken();
      debugPrint('token is $token');
      if (token != null) {
        Navigator.pushReplacementNamed(context, DashBoard.routeName);
      } else {
        Navigator.pushReplacementNamed(context, Onboarding.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: Image.asset('assets/images/hts_plus_splash_bg_image.png'),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.white.withOpacity(0.2),
                  AppColors.white,
                ],
              ),
            ),
          ),
          Positioned(
            // bottom: 190,
            top: 290,
            right: 20,
            left: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: Image.asset('assets/logo/hts_plus_logo.png'),
                ),
                100.hSpace,
                Text(
                  Strings.yourPremierOnlineGroceryPlatform,
                  style: context.textTheme.s16w600
                      .copyWith(color: AppColors.primaryColor),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
