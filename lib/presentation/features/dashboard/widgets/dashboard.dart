import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/presentation/view/wish_list_screen.dart';
import 'package:hts_plus/presentation/features/dashboard/help/presentation/view/help_screen.dart';
import 'package:hts_plus/presentation/features/dashboard/profile/profile_screen.dart';
import 'package:hts_plus/presentation/features/dashboard/search/presentation/view/search_screen.dart';
import 'package:hts_plus/presentation/features/stores/presentation/view/stores_screen.dart';

class DashBoard extends ConsumerStatefulWidget {
  const DashBoard({super.key});
  static const routeName = '/dashboard';

  @override
  ConsumerState<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends ConsumerState<DashBoard> {
  List pages = [
    const StoresScreen(),
    const WishListScreen(),
    const SearchScreen(),
    const HelpScreen(),
    const ProfileScreen()
  ];

  int selectedIndex = 0;

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    // ref.read(getAccountOwnerNotifierProvider.notifier).getAccountOwnerProfile();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.secondaryColor,
        elevation: 0,
        currentIndex: selectedIndex,
        onTap: (index) {
          changePage(index);
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: Icon(Icons.home_outlined)
                  
                 // SvgPicture.asset('assets/icons/home_icon.svg')
                  
                  ),
              label: ''),
          BottomNavigationBarItem(
              icon: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child:  Icon(Icons.favorite_outline)
                  
                  //SvgPicture.asset('assets/icons/favorite_icon.svg'),
                  
                  ),
              label: ''),
          BottomNavigationBarItem(
              icon: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child:  Icon(Icons.search)
                  
                  //SvgPicture.asset('assets/icons/search_icon.svg'),
                  
                  ),
              label: ''),
          BottomNavigationBarItem(
              icon: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child:  Icon(Icons.support_agent)
                  
                  //SvgPicture.asset('assets/icons/help_icon.svg'),
                  
                  ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                height: 34.h,
                width: 34.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: AppColors.secondaryColor,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/hts_user_image.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              label: ''),
        ],
      ),
    );
  }
}
