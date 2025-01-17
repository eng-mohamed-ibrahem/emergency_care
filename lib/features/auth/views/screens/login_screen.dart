import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:emergency_care/config/navigation/routes.dart';
import 'package:emergency_care/config/themes/text_styles.dart';
import 'package:emergency_care/core/constants/app_colors.dart';
import 'package:emergency_care/core/constants/assets_manager.dart';
import 'package:emergency_care/core/constants/validators.dart';
import 'package:emergency_care/core/utils/shared/input_form_field.dart';
import 'package:emergency_care/features/auth/views/widgets/main_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Stack(
                    children: [
                      RepaintBoundary(
                        child: SvgPicture.asset(
                          AssetsManager.loginSvgImage,
                          width: 370.w,
                          height: 310.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Locale currentLang =
                              context.locale.languageCode == 'en'
                                  ? Locale('ar')
                                  : Locale('en');
                          context.setLocale(currentLang);
                        },
                        label: Text(
                          context.locale.languageCode == 'en'
                              ? 'العربية'
                              : 'English',
                          style: TextStyles.subtitle.copyWith(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        icon: Icon(
                          Icons.language_rounded,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Text(
                  'sign_in.title'.tr(),
                  style: TextStyles.title,
                ),
                const SizedBox(height: 5),
                Text(
                  'sign_in.subtitle'.tr(),
                  style: TextStyles.subtitle,
                ),
                const SizedBox(height: 20),
                // Email TextField
                InputFormField(
                  hintText: "sign_in.email".tr(),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.iconUnselectedColor,
                    size: 24.sp,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                // Password TextField
                InputFormField(
                  isPassword: true,
                  hintText: 'sign_in.password'.tr(),
                  keyboardType: TextInputType.visiblePassword,
                  validator: Validators.validatePassword,
                ),
                const SizedBox(height: 16),
                // Forgot password
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'sign_in.forgot_password'.tr(),
                        style: TextStyles.miniTitle.copyWith(
                          color: AppColors.primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle forgot password tap
                          },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),

                // Sign in button
                MainButton(
                  text: 'sign_in.button'.tr(),
                  onPressed: () {
                    // Handle sign in button tap
                    if (_formKey.currentState!.validate()) {
                      context.go(Routes.home.path);
                    }
                  },
                ),
                const SizedBox(height: 16),
                // Register now
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'sign_in.new_member'.tr(),
                        style: TextStyles.subtitle,
                        children: [
                          TextSpan(
                            text: 'sign_in.register'.tr(),
                            style: TextStyles.subtitle.copyWith(
                              color: AppColors.primaryColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle register now tap
                                context.push(Routes.register.path);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
