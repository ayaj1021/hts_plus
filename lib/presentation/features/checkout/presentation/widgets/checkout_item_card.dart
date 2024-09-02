import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';

class CheckOutItemCard extends ConsumerStatefulWidget {
  const CheckOutItemCard(
      {super.key,
      required this.image,
      required this.itemName,
      required this.id,
      required this.quantity,
      required this.itemAmount});
  final String image;
  final String itemName;
  final String itemAmount;
  final String quantity;
  final int id;

  @override
  ConsumerState<CheckOutItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends ConsumerState<CheckOutItemCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 14),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.primarySwatch.shade100,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.secondarySwatch.shade50,
                    backgroundImage: NetworkImage(widget.image),
                  ),
                  8.hSpace,
                  SizedBox(
                    width: 120.w,
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.itemName,
                          style: context.textTheme.s14w500.copyWith(
                              color: AppColors.primarySwatch.shade900),
                          overflow: TextOverflow.ellipsis,
                        ),
                        10.hSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'N${widget.itemAmount}',
                              style: context.textTheme.s14w600
                                  .copyWith(color: AppColors.primary19191A),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryColor),
                              child: Text(
                                '${widget.quantity}',
                                style: context.textTheme.s14w500.copyWith(
                                  color: AppColors.primarySwatch.shade50,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // loadState.isLoading
        //     ? Padding(
        //         padding: const EdgeInsets.all(4),
        //         child: CircularProgressIndicator(
        //           color: AppColors.primaryColor,
        //         ),
        //       )
        //     : SizedBox.shrink()
      ],
    );
  }
}
