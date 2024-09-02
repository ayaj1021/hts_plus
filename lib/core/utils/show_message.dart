import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';


displayMessage({
  required BuildContext context,
  required String message,
  bool? isError,
  Color? color,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      backgroundColor: isError == true ? Colors.red : Colors.green,
      margin: EdgeInsets.only(
         bottom: 20,
        left: 10,
        right: 10,
      ),
      elevation: 3,
      duration: Duration(milliseconds: 4000),
      content: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Icon(
                isError == true ? Icons.error_outline : Icons.check_circle,
                color: Colors.white,
              ),
              10.hSpace,
              SizedBox(
                width: 250.w,
                child: Text(
                  message,
                  style: context.textTheme.s14w700
                      .copyWith(color: AppColors.white,),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          )),

      // Color(0xff272727),
      //isError == true ? Colors.red : Colors.green,
    ),
  );
}
