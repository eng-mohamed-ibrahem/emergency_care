import 'package:avatar_glow/avatar_glow.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emergency_care/config/themes/text_styles.dart';
import 'package:emergency_care/core/constants/app_colors.dart';
import 'package:emergency_care/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'home.welcome'.tr(),
                        style: TextStyles.middleTitle.copyWith(
                          color: Color(0xff7D7B7B),
                          // color: AppColors.hintTextColor,
                        ),
                      ),
                      Text(
                        'Mohamed Ibrahem',
                        style: TextStyles.middleTitle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 25.r,
                    backgroundColor: AppColors.hintTextColor,
                    child: Icon(
                      Icons.person,
                      size: 40.r,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "home.have_emergency".tr(),
              style: TextStyles.middleTitle.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 28.sp,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "home.hint".tr(),
              textAlign: TextAlign.center,
              style: TextStyles.subtitle.copyWith(
                fontWeight: FontWeight.normal,
                color: Color(0xff979797),
                fontSize: 18.sp,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                // handle tap send messages to emergenct contacts
              },
              child: AvatarGlow(
                startDelay: const Duration(milliseconds: 1000),
                glowColor: AppColors.primaryColor,
                glowShape: BoxShape.circle,
                glowRadiusFactor: .25,
                curve: Curves.fastOutSlowIn,
                child: CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 100.r,
                  child: SvgPicture.asset(AppImages.handPressed),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
