import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/presentation/features/login/presentation/view/login_screen.dart';
import 'package:hts_plus/presentation/features/onboarding/presentation/widgets/onboarding_data.dart';
import 'package:hts_plus/presentation/features/onboarding/presentation/widgets/page_indicator.dart';
import 'package:hts_plus/presentation/features/onboarding/presentation/widgets/skip_button_section.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  static const routeName = '/onboarding';

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  //= PageController();

  final controller = OnboardingInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              child: Image.asset('assets/images/onboard_bg_image.png'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                30.hSpace,
                SizedBox(
                  height: 65.h,
                  width: 65.w,
                  child: Image.asset('assets/logo/hts_plus_logo.png'),
                ),
                32.hSpace,
                Expanded(
                  child: PageView(
                    onPageChanged: (value) {
                      // setState(() {
                      //   currentIndex = value;
                      // });
                    },
                    controller: _pageController,
                    pageSnapping: true,
                    children: List.generate(
                      controller.onboardingData.length,
                      (index) {
                        // setState(() {
                        //   currentIndex = index;
                        // });
                        final content = controller.onboardingData[index];
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Column(
                                children: [
                                  Text(
                                    content.title,
                                    style: context.textTheme.s32w600.copyWith(
                                      color: AppColors.primary1A6824,
                                      height: 1.2,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  25.hSpace,
                                  Text(
                                    content.description,
                                    style: context.textTheme.s14w400.copyWith(
                                      color: AppColors.primary8D94A9,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  36.hSpace,
                                  PageIndicator(
                                      position: currentIndex,
                                      count: controller.onboardingData.length),
                                  60.hSpace,
                                ],
                              ),
                            ),
                            50.hSpace,
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: Image.asset(
                                  content.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 310,
                child: SkipButtonSection(
                  nextOnTap: () {
                    setState(() {
                      currentIndex != controller.onboardingData.length - 1
                          ? currentIndex++
                          : context.pushNamed<void>(LoginScreen.routeName);
                      //nextScreenReplace(context,  LoginScreen());
                    });
                  },
                )),
          ],
        ),
      ),
    );
  }
}

typedef OnboardingData = ({String title, String description, String image});
