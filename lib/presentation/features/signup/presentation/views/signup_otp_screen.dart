import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';
import 'package:hts_plus/core/extensions/overlay_extension.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/core/utils/show_message.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/core/utils/validators.dart';
import 'package:hts_plus/presentation/features/map_location/presentation/views/map_screen.dart';
import 'package:hts_plus/presentation/features/signup/presentation/notifier/verify_sign_up_otp_notifer.dart';
import 'package:hts_plus/presentation/features/signup/presentation/views/signup_screen.dart';
import 'package:hts_plus/presentation/features/signup/presentation/widgets/sign_up_otp_input_section.dart';
import 'package:hts_plus/presentation/features/signup/presentation/widgets/signup_otp_screen_app_bar.dart';
import 'package:hts_plus/presentation/general_widgets/app_button.dart';
import 'package:hts_plus/presentation/general_widgets/auth_title.dart';

class SignUpOtpScreen extends ConsumerStatefulWidget {
  const SignUpOtpScreen({super.key, required this.email});
  final String email;

  static const routeName = '/signOtpScreen';

  @override
  ConsumerState<SignUpOtpScreen> createState() => _SignUpOtpScreenState();
}

class _SignUpOtpScreenState extends ConsumerState<SignUpOtpScreen> {
  late TextEditingController _codeController;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _codeController.dispose();

    super.dispose();
  }

  String userEmail = '';

  @override
  void initState() {
    super.initState();

    _codeController = TextEditingController()
      ..addListener(_validateInput)
      ..addListener(_validateInput);
  }

  void _validateInput() async {
    ref.read(verifySignUpOtpNotifier.notifier).allInputValid(
          confirmationCode: Validators.email()(_codeController.text) == null,
        );
  }

  void _verifySignUpOtp() async {
    ref.read(verifySignUpOtpNotifier.notifier).verifySignUpOtp(
          otp: _codeController.text.trim(),
          onError: (error) {
            context.showError(message: error);
          },
          onSuccess: () {
            displayMessage(context: context, message: 'Account verified');
            context
              ..hideOverLay()
              ..pushNamed(MapScreen.routeName);
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
          child: Form(
            key: _formKey,
            onChanged: () => setState(() {}),
            child: Column(
              children: [
                const SignUpOtpAppBar(),
                const AuthTitle(
                  title: Strings.emailCodeSentTo,
                ),
                12.hSpace,
                Text(
                  userEmail,
                  style: context.textTheme.s15w400.copyWith(
                    color: AppColors.primary707070,
                  ),
                ),
                40.hSpace,
                SignUpOtpInputSection(
                  codeController: _codeController,
                ),
                30.hSpace,
                Consumer(builder: (context, r, c) {
                  final isLoading = r.watch(
                    verifySignUpOtpNotifier
                        .select((v) => v.verifySignUpOtpState.isLoading),
                  );
                  return ButtonWidget(
                    isEnabled: r.watch(
                          verifySignUpOtpNotifier.select((v) => v.inputValid),
                        ) &&
                        !isLoading,
                    isLoading: isLoading,
                    onTap: () {
                      if (_codeController.text.isEmpty) {
                        context.showError(message: 'Otp field is required');
                        return;
                      }
                      _verifySignUpOtp();
                    },

                    // context.pushReplacementNamed(DashBoard.routeName),
                    text: Strings.continueText.toUpperCase(),
                  );
                }),
                16.hSpace,
                RichText(
                  text: TextSpan(
                    text: Strings.wrongEmail,
                    style: context.textTheme.s14w400.copyWith(
                      color: AppColors.primary555F7E,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushNamed(SignUpScreen.routeName);
                          },
                        text: Strings.startOver,
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
      )),
    );
  }
}
