import 'package:flutter/material.dart';
import 'package:hts_plus/presentation/features/cart/data/model/get_cart_model.dart';
import 'package:hts_plus/presentation/features/cart/presentation/widgets/cart_items.dart';

class UnEmptyCartSection extends StatefulWidget {
  const UnEmptyCartSection({super.key, required this.cartItems});
  final List<GetCartData> cartItems;

  @override
  State<UnEmptyCartSection> createState() => _UnEmptyCartSectionState();
}

class _UnEmptyCartSectionState extends State<UnEmptyCartSection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: CartItems(
                  cartItems: widget.cartItems,
                ),

                // SizedBox(
                //   height: 33,
                //   width: MediaQuery.of(context).size.width,
                //   child: TabBar(
                //     indicatorColor: AppColors.secondaryColor,
                //     indicatorSize: TabBarIndicatorSize.tab,
                //     labelColor: AppColors.secondaryColor,
                //     indicatorWeight: 4,
                //     unselectedLabelColor: AppColors.primary979899,
                //     unselectedLabelStyle: context.textTheme.s14w700,
                //     dividerHeight: 0,
                //     controller: _tabController,
                //     tabs: [
                //       Text(
                //         Strings.cartItems,
                //       ),
                //       Text(
                //         Strings.checkOut,
                //       ),
                //       Text(
                //         Strings.delivery,
                //       ),
                //     ],
                //   ),
                // ),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height,
              //   width: MediaQuery.of(context).size.width,
              //   child: TabBarView(controller: _tabController, children: [
              //     CartItems(cartItems: widget.cartItems,),
              //     CheckOutSection(),
              //     Delivery(),
              //   ]),
              // )
            ],
          ),
        ),
      ],
    );
  }
}
