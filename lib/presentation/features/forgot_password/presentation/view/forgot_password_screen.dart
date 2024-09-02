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
import 'package:hts_plus/presentation/features/forgot_password/data/model/forgot_password_request.dart';
import 'package:hts_plus/presentation/features/forgot_password/presentation/notifier/forgot_password_notifier.dart';
import 'package:hts_plus/presentation/features/forgot_password/presentation/widgets/forgot_password_appbar.dart';
import 'package:hts_plus/presentation/features/forgot_password/presentation/widgets/forgot_password_password_input_section.dart';
import 'package:hts_plus/presentation/features/signup/presentation/views/signup_screen.dart';
import 'package:hts_plus/presentation/features/reset_password/presentation/view/reset_password_screen.dart';
import 'package:hts_plus/presentation/general_widgets/app_button.dart';
import 'package:hts_plus/presentation/general_widgets/auth_title.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const routeName = '/forgotPasswordScreen';

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final ValueNotifier<bool> _isLoginEnabled = ValueNotifier(false);
  late TextEditingController _emailController;

  @override
  void initState() {
    _emailController = TextEditingController()..addListener(_listener);

    super.initState();
  }

  void _listener() {
    _isLoginEnabled.value = _emailController.text.isNotEmpty;
  }

  @override
  void dispose() {
    _isLoginEnabled.dispose();
    _emailController.dispose();

    super.dispose();
  }

  void _forgotPassword() {
    final data = ForgotPasswordRequest(
      email: _emailController.text.trim(),
    );

    ref.read(forgotPasswordNotifier.notifier).forgotPassword(
          data: data,
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: () {
            //  displayMessage(context: context, message:'A reset token has been sent to your registered mail');
            context
              ..hideOverLay()
              ..pushNamed(ResetPasswordScreen.routeName);
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21, vertical: 15),
          child: Column(
            children: [
              ForgotPasswordAppBar(),
              AuthTitle(
                title: Strings.resetYourPassword,
              ),
              16.hSpace,
              ForgotPasswordInputSection(
                emailController: _emailController,
              ),
              30.hSpace,
              Consumer(builder: (context, re, c) {
                final isLoading = re.watch(
                  forgotPasswordNotifier
                      .select((v) => v.forgotPasswordState.isLoading),
                );
                return ButtonWidget(
                  isEnabled: re.watch(
                        forgotPasswordNotifier.select((v) => v.inputValid),
                      ) &&
                      !isLoading,
                  isLoading: isLoading,
                  onTap: () {
                    if (_emailController.text.isEmpty) {
                      context.showError(message: 'Email field is required');
                      return;
                    }
                    _forgotPassword();
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
    );
  }
}
