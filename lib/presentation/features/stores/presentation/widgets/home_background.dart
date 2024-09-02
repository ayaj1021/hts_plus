import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreDetailsBackground extends StatelessWidget {
  const StoreDetailsBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/home_background_image.png',
        ),
        Container(
          height: 300.h,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  // Colors.black,
                  Color(0xffFF8901),
                  Color(0xffFF8901).withOpacity(0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        )
      ],
    );
  }
}
