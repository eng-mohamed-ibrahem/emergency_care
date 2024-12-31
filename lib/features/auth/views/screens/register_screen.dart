import 'package:easy_localization/easy_localization.dart';
import 'package:emergency_care/config/navigation/routes.dart';
import 'package:emergency_care/config/themes/text_styles.dart';
import 'package:emergency_care/core/constants/app_colors.dart';
import 'package:emergency_care/core/constants/app_images.dart';
import 'package:emergency_care/core/constants/validators.dart';
import 'package:emergency_care/core/utils/methods/methods.dart';
import 'package:emergency_care/features/auth/views/widgets/auth_button.dart';
import 'package:emergency_care/features/auth/views/widgets/input_form_field.dart';
import 'package:emergency_care/features/auth/views/widgets/phone_number_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                RepaintBoundary(
                  child: SvgPicture.asset(
                    AppImages.loginSvgImage,
                    width: 370.w,
                    height: 310.h,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 20),
                Text(
                  'sign_up.title'.tr(),
                  style: TextStyles.title,
                ),
                const SizedBox(height: 5),
                Text(
                  'sign_up.subtitle'.tr(),
                  style: TextStyles.subtitle,
                ),
                const SizedBox(height: 20),
                // Name TextField
                InputFormField(
                  controller: _nameController,
                  hintText: "sign_up.name".tr(),
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: AppColors.iconUnselectedColor,
                    size: 24.sp,
                  ),
                  keyboardType: TextInputType.name,
                  validator: Validators.validateName,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                // Email TextField
                InputFormField(
                  controller: _emailController,
                  hintText: "sign_up.email".tr(),
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

                // Phone TextField
                PhoneNumberField(
                  controller: _phoneController,
                  onChanged: (phone) {
                    kDebugPrint(phone);
                  },
                  validator: (phone) {
                    return Validators.validatePhone(
                        phone!.number, phone.isValidNumber());
                  },
                ),

                // Password TextField
                InputFormField(
                  controller: _passwordController,
                  isPassword: true,
                  hintText: 'sign_up.password'.tr(),
                  keyboardType: TextInputType.visiblePassword,
                  validator: Validators.validatePassword,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                // Confirm Password TextField
                InputFormField(
                  controller: _confirmPasswordController,
                  isPassword: true,
                  hintText: 'sign_up.confirm_password'.tr(),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'auth.required.confirm_password'.tr();
                    } else if (value != _passwordController.text) {
                      return 'auth.invalid.password_not_match'.tr();
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Register Button
                AuthButton(
                  text: 'sign_up.button'.tr(),
                  onPressed: () {
                    // Handle register button tap
                    if (_formKey.currentState!.validate()) {
                      kDebugPrint('Registering user...');
                    }
                  },
                ),
                const SizedBox(height: 16),
                // Login Button
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'sign_up.already_member'.tr(),
                        style: TextStyles.miniTitle,
                        children: [
                          TextSpan(
                            text: 'sign_up.sign_in'.tr(),
                            style: TextStyles.miniTitle.copyWith(
                              color: AppColors.primaryColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.go(Routes.login.path);
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
