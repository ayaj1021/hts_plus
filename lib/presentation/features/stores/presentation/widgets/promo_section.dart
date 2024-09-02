import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PromoSection extends StatefulWidget {
  const PromoSection({super.key});

  @override
  State<PromoSection> createState() => _PromoSectionState();
}

class _PromoSectionState extends State<PromoSection>
    with SingleTickerProviderStateMixin {
  PageController _controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150.h,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            children: [
              PromoContainer(
                image: 'assets/images/promo_image_three.png',
              ),
              PromoContainer(
                image: 'assets/images/promo_image_three.png',
              ),
              PromoContainer(
                image: 'assets/images/promo_image_three.png',
              ),
            ],
          ),
        ),
      
        SmoothPageIndicator(
          controller: _controller,
          count: 3,
          effect: WormEffect(
              dotHeight: 6,
              dotWidth: 6,
              dotColor: AppColors.secondarySwatch.shade100,
              activeDotColor: AppColors.secondaryColor),
        )
      ],
    );
  }
}

class PromoContainer extends StatelessWidget {
  const PromoContainer({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 95.h,
      width: 342.w,
      child: Image.asset(image),
    );
  }
}
