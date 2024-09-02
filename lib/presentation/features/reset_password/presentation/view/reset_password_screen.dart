import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/database/database.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';
import 'package:hts_plus/core/extensions/overlay_extension.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/core/utils/show_message.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/presentation/features/forgot_password/presentation/widgets/forgot_password_appbar.dart';
import 'package:hts_plus/presentation/features/login/presentation/view/login_screen.dart';
import 'package:hts_plus/presentation/features/reset_password/data/model/reset_password_request.dart';
import 'package:hts_plus/presentation/features/reset_password/presentation/notifier/reset_password_notifier.dart';
import 'package:hts_plus/presentation/features/reset_password/presentation/widgets/reset_password_password_input_section.dart';
import 'package:hts_plus/presentation/features/signup/presentation/views/signup_screen.dart';
import 'package:hts_plus/presentation/general_widgets/app_button.dart';
import 'package:hts_plus/presentation/general_widgets/auth_title.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});
  static const routeName = '/verifyResetPasswordOtpScreen';

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final ValueNotifier<bool> _isLoginEnabled = ValueNotifier(false);
  late TextEditingController _passwordController;
  late TextEditingController _reEnterPasswordController;
  late TextEditingController _passwordHintController;

  @override
  void initState() {
    _passwordController = TextEditingController()..addListener(_listener);
    _reEnterPasswordController = TextEditingController()
      ..addListener(_listener);
    _passwordHintController = TextEditingController()..addListener(_listener);

    super.initState();
  }

  void _listener() {
    _isLoginEnabled.value = _passwordController.text.isNotEmpty &&
        _reEnterPasswordController.text.isNotEmpty &&
        _passwordHintController.text.isNotEmpty;
  }

  @override
  void dispose() {
    _isLoginEnabled.dispose();
    _passwordController.dispose();
    _reEnterPasswordController.dispose();
    _passwordHintController.dispose();

    super.dispose();
  }

  void _resetPassword() async {
    final storage = await SecureStorage();
    final code = await storage.getUserForgotPasswordCode();
    final data = ResetPasswordRequest(
      code: '$code',
      password: _passwordController.text.trim(),
      confirmPassword: _reEnterPasswordController.text.trim(),
    );

    ref.read(resetPasswordNotifier.notifier).resetPassword(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: () {
            displayMessage(
                context: context, message: 'Password reset successfully');
            context
              ..hideOverLay()
              ..replaceAll(LoginScreen.routeName);
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 21, vertical: 15),
            child: Column(
              children: [
                ForgotPasswordAppBar(),
                AuthTitle(
                  title: Strings.typeYourNewPassword,
                ),
                11.hSpace,
                Text(
                  Strings.minimumOfSixCharacters,
                  style: context.textTheme.s15w400.copyWith(
                    color: AppColors.primary707070,
                  ),
                  textAlign: TextAlign.center,
                ),
                16.hSpace,
                ResetPasswordInputSection(
                  passwordController: _passwordController,
                  reEnterPasswordController: _reEnterPasswordController,
                  passwordHintController: _passwordHintController,
                ),
                30.hSpace,
                Consumer(builder: (context, re, c) {
                  final isLoading = re.watch(
                    resetPasswordNotifier
                        .select((v) => v.resetPasswordState.isLoading),
                  );
                  return ButtonWidget(
                    isEnabled: re.watch(
                          resetPasswordNotifier.select((v) => v.inputValid),
                        ) &&
                        !isLoading,
                    isLoading: isLoading,
                    onTap: () {
                      if (_passwordController.text.isEmpty ||
                          _reEnterPasswordController.text.isEmpty ||
                          _passwordHintController.text.isEmpty) {
                        context.showError(message: 'All fields are required');
                        return;
                      }
                      _resetPassword();
                    },
                    text: Strings.continueText.toUpperCase(),
                  );
                }),
                16.hSpace,
                RichText(
                  text: TextSpan(
                    text: Strings.or,
                    style: context.textTheme.s14w400.copyWith(
                      color: AppColors.primary555F7E,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushNamed(SignUpScreen.routeName);
                          },
                        text: Strings.createANewAccount,
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
