import 'package:emergency_care/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle get title {
    return TextStyle(
      fontSize: 48.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.textColor,
    );
  }

  static TextStyle get middleTitle {
    return TextStyle(
      fontSize: 26.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
    );
  }

  static TextStyle get buttonTextStyle {
    return TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.buttonTextColor,
    );
  }

  static TextStyle get subtitle {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
      color: AppColors.textColor,
    );
  }

  static TextStyle get miniTitle {
    return TextStyle(
      color: AppColors.textColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
    );
  }
}
