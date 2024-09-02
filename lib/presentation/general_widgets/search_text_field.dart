import 'package:flutter/material.dart';
import 'package:hts_plus/core/theme/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.hintText, required this.controller, this.onChanged,
  });
  final String hintText;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.white,
            border: Border.all(
              width: 1,
              color: AppColors.authFieldBorderColor,
            )),
        child: TextField(
          onChanged:  onChanged,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.secondaryColor,
            ),
            border: InputBorder.none,
            
          ),
        ));
  }
}
