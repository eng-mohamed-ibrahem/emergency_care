import 'package:emergeny_care/config/themes/text_styles.dart';
import 'package:emergeny_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        fixedSize: Size(MediaQuery.sizeOf(context).width, 50.h),
      ),
      label: Text(
        text,
        style: TextStyles.buttonTextStyle,
      ),
      iconAlignment: IconAlignment.end,
      icon: Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.buttonTextColor,
        size: 24.sp,
      ),
    );
  }
}
