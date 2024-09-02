import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';
import 'package:hts_plus/core/extensions/overlay_extension.dart';
import 'package:hts_plus/core/extensions/space_extension.dart';
import 'package:hts_plus/core/extensions/strings_extensions.dart';
import 'package:hts_plus/core/extensions/text_theme_extension.dart';
import 'package:hts_plus/core/theme/app_colors.dart';
import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:hts_plus/core/utils/validators.dart';
import 'package:hts_plus/presentation/features/login/presentation/view/login_screen.dart';
import 'package:hts_plus/presentation/features/signup/data/model/sign_up_request.dart';
import 'package:hts_plus/presentation/features/signup/presentation/notifier/sign_up_notifier.dart';
import 'package:hts_plus/presentation/features/signup/presentation/views/signup_otp_screen.dart';
import 'package:hts_plus/presentation/features/signup/presentation/widgets/signup_input_section.dart';

import 'package:hts_plus/presentation/general_widgets/app_button.dart';
import 'package:hts_plus/presentation/general_widgets/auth_title.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});
  static const routeName = '/signUpScreen';

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _reEnterPasswordController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _reEnterPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController()..addListener(_validateInput);
    _passwordController = TextEditingController()..addListener(_validateInput);
    _firstNameController = TextEditingController()..addListener(_validateInput);
    _lastNameController = TextEditingController()..addListener(_validateInput);

    _reEnterPasswordController = TextEditingController()
      ..addListener(_validateInput);
  }

  void _validateInput() {
    ref.read(registerNotifier.notifier).allInputValid(
          emailValid: Validators.email()(_emailController.text) == null,
          passwordValid: Validators.password()(_passwordController.text) ==
                  null &&
              Validators.password()(_reEnterPasswordController.text) == null &&
              _passwordController.text == _reEnterPasswordController.text,
          nameValid: Validators.name()(_firstNameController.text) == null &&
              Validators.name()(_lastNameController.text) == null,
        );
  }

  void _signUp() {
    print('ayaj@gmail.com'.redactedEmail);
    ref.read(registerNotifier.notifier).signUp(
          data: SignUpRequest(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
            firstName: _firstNameController.text.trim(),
            lastName: _lastNameController.text.trim(),
            stateId: 1.toString(),
            regionId: 1.toString(),
          ),
          onError: (error) {
            context.showError(message: 'User already exists');
          },
          onSuccess: () {
            context
              ..hideOverLay()
              ..showSuccess(
                  message: 'Otp has been sent to your registered email')
              ..pushNamed(SignUpOtpScreen.routeName);
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21, vertical: 15),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              onChanged: () => setState(() {}),
              child: Column(
                children: [
                 // SignUpAppBar(),
                  AuthTitle(
                    title: Strings.letsGetYouStarted,
                  ),
                  40.hSpace,
                  SignUpInputSection(
                    emailController: _emailController,
                    passwordController: _passwordController,
                    firstNameController: _firstNameController,
                    lastNameController: _lastNameController,
                    reEnterPasswordController: _reEnterPasswordController,
                  ),
                  Consumer(builder: (context, r, _) {
                    final isLoading = r.watch(
                      registerNotifier.select((v) => v.registerState.isLoading),
                    );
                    return ButtonWidget(
                      isEnabled: r.watch(
                            registerNotifier.select((v) => v.inputValid),
                          ) &&
                          !isLoading,
                      isLoading: isLoading,
                      text: Strings.signUp.toUpperCase(),
                      onTap: () {
                        if (_firstNameController.text.isEmpty ||
                            _lastNameController.text.isEmpty ||
                            _emailController.text.isEmpty ||
                            _passwordController.text.isEmpty ||
                            _reEnterPasswordController.text.isEmpty) {
                          context.showError(message: 'All fields are required');
                          return;
                        }

                        if (_passwordController.text !=
                            _reEnterPasswordController.text) {
                          context.showError(message: 'Password do not match');
                          return;
                        }

                        if (_passwordController.text.length < 8) {
                          context.showError(
                              message:
                                  'Password must be minimum of 8 characters');
                          return;
                        }
                        _signUp();
                      },

                      // context.popAndPushNamed(SignUpOtpScreen.routeName),
                    );
                  }),
                  16.hSpace,
                  RichText(
                    text: TextSpan(
                      text: Strings.gotAnAccount,
                      style: context.textTheme.s14w400.copyWith(
                        color: AppColors.primary555F7E,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.pushNamed(LoginScreen.routeName);
                            },
                          text: Strings.logIn,
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
      ),
    );
  }
}
