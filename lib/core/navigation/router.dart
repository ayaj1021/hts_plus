import 'package:flutter/widgets.dart';
import 'package:hts_plus/presentation/features/all_products/presentation/view/all_products_screen.dart';
import 'package:hts_plus/presentation/features/cart/presentation/view/cart_screen.dart';
import 'package:hts_plus/presentation/features/categories/presentation/view/category_screen.dart';
import 'package:hts_plus/presentation/features/dashboard/widgets/dashboard.dart';
import 'package:hts_plus/presentation/features/forgot_password/presentation/view/forgot_password_screen.dart';
import 'package:hts_plus/presentation/features/map_location/presentation/views/enter_location_screen.dart';
import 'package:hts_plus/presentation/features/map_location/presentation/views/map_screen.dart';
import 'package:hts_plus/presentation/features/store_products/presentation/view/store_products_view.dart';
import 'package:hts_plus/presentation/features/stores/presentation/view/stores_details_page.dart';
import 'package:hts_plus/presentation/features/login/presentation/view/login_screen.dart';
import 'package:hts_plus/presentation/features/login_options/presentation/views/login_option_screen.dart';
import 'package:hts_plus/presentation/features/onboarding/presentation/pages/onboarding.dart';
import 'package:hts_plus/presentation/features/signup/presentation/views/signup_screen.dart';
import 'package:hts_plus/presentation/features/signup/presentation/views/signup_otp_screen.dart';
import 'package:hts_plus/presentation/features/stores/presentation/view/stores_screen.dart';
import 'package:hts_plus/presentation/features/reset_password/presentation/view/reset_password_screen.dart';
import 'package:hts_plus/presentation/general_widgets/splash_screen.dart';

class AppRouter {
  static final Map<String, Widget Function(BuildContext)> _routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    Onboarding.routeName: (context) => const Onboarding(),
    LoginOptionScreen.routeName: (context) => const LoginOptionScreen(),
    LoginScreen.routeName: (context) => const LoginScreen(),
    SignUpScreen.routeName: (context) => const SignUpScreen(),
    SignUpOtpScreen.routeName: (context) => const SignUpOtpScreen(
          email: '',
        ),
    ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
    StoreDetailsPage.routeName: (context) => const StoreDetailsPage(
          storeId: '',
          image: '', filteredItems: [],
        ),
    DashBoard.routeName: (context) => const DashBoard(),
    StoresScreen.routeName: (context) => const StoresScreen(),
    AllProductsScreen.routeName: (context) => const AllProductsScreen(),
    CartScreen.routeName: (context) => const CartScreen(),
    ResetPasswordScreen.routeName: (context) => const ResetPasswordScreen(),
    CategoryScreen.routeName: (context) => const CategoryScreen(),
    MapScreen.routeName: (context) => const MapScreen(),
    EnterLocationScreen.routeName: (context) => const EnterLocationScreen(),
    AllStoreProductsScreen.routeName: (context) => const AllStoreProductsScreen(storeId: '',),
  //  CheckoutScreen.routeName: (context) => const CheckoutScreen(),
  };
  static Map<String, Widget Function(BuildContext)> get routes => _routes;
}
