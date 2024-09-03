import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';
import 'package:hts_plus/core/extensions/overlay_extension.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/features/dashboard/widgets/dashboard.dart';
import 'package:hts_plus/presentation/features/forgot_password/presentation/view/forgot_password_screen.dart';
import 'package:hts_plus/presentation/features/login/data/models/login_request.dart';
import 'package:hts_plus/presentation/features/login/presentation/notifier/login_notifier.dart';
import 'package:hts_plus/presentation/features/login/presentation/widgets/login_app_bar.dart';
import 'package:hts_plus/presentation/features/login/presentation/widgets/login_input_section.dart';
import 'package:hts_plus/presentation/features/signup/presentation/views/signup_screen.dart';
import 'package:hts_plus/presentation/general_widgets/app_button.dart';
import 'package:hts_plus/presentation/general_widgets/auth_title.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/loginScreen';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final ValueNotifier<bool> _isLoginEnabled = ValueNotifier(false);
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController()..addListener(_listener);
    _passwordController = TextEditingController()..addListener(_listener);
    super.initState();
  }

  void _listener() {
    _isLoginEnabled.value =
        _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
  }

  @override
  void dispose() {
    _isLoginEnabled.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    final data = LoginRequest(
      password: _passwordController.text.trim(),
      email: _emailController.text.trim(),
    );

    ref.read(loginNotifier.notifier).login(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: () {
            context
              ..hideOverLay()
              ..replaceAll(DashBoard.routeName);
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LoginAppBar(),
                const AuthTitle(
                  title: Strings.pickupWhereYouLeftOff,
                ),
                40.hSpace,
                LoginInputSection(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                Consumer(builder: (context, re, c) {
                  final isLoading = re.watch(
                    loginNotifier.select((v) => v.loginState.isLoading),
                  );
                  return ButtonWidget(
                      isEnabled: re.watch(
                            loginNotifier.select((v) => v.inputValid),
                          ) &&
                          !isLoading,
                      isLoading: isLoading,
                      onTap: () {
                        if (_emailController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          context.showError(message: 'All fields are required');
                          return;
                        }
                        _login();
                      },
                      text: Strings.logIn.toUpperCase());
                }),
                30.hSpace,
                GestureDetector(
                  onTap: () =>
                      context.pushNamed(ForgotPasswordScreen.routeName),
                  child: Text(
                    Strings.forgotPassword,
                    style: context.textTheme.s15w400.copyWith(
                      color: AppColors.primary39B54A,
                    ),
                  ),
                ),
                16.hSpace,
                RichText(
                  text: TextSpan(
                    text: Strings.dontHaveAnAccount,
                    style: context.textTheme.s14w400.copyWith(
                      color: AppColors.primary555F7E,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushNamed(SignUpScreen.routeName);
                          },
                        text: Strings.signUp,
                        style: context.textTheme.s14w400.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
