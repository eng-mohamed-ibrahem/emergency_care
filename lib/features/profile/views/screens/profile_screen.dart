import 'package:easy_localization/easy_localization.dart';
import 'package:emergency_care/config/themes/text_styles.dart';
import 'package:emergency_care/core/constants/app_colors.dart';
import 'package:emergency_care/core/constants/assets_manager.dart';
import 'package:emergency_care/features/profile/views/widgets/settings_card.dart';
import 'package:emergency_care/features/profile/views/widgets/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.05,
              ),
              // Profile Picture
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleAvatar(
                    radius: 60.r,
                    backgroundColor: Colors.blue.shade100,
                    child: CircleAvatar(
                      radius: 58.r,
                      backgroundImage: AssetImage(AssetsManager.avatar),
                    ),
                  ),
                  PositionedDirectional(
                    end: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: SvgPicture.asset(
                          AssetsManager.editPenIcon,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              // Profile Name and Email
              Text(
                'Mohamed Ibrahem',
                textAlign: TextAlign.center,
                style: TextStyles.middleTitle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'mohamed.data13@gmail.com | +20 1275314934',
                textAlign: TextAlign.center,
                style: TextStyles.subtitle,
              ),
              SizedBox(
                height: 20,
              ),
              // First Settings Group
              SettingsCard(
                children: [
                  SettingsTile(
                    leadingIcon:
                        SvgPicture.asset(AssetsManager.profileEditIcon),
                    title: 'profile.edit'.tr(),
                    onTap: () {},
                  ),
                  SettingsTile(
                    leadingIcon: SvgPicture.asset(AssetsManager.languageIcon),
                    title: 'profile.lang'.tr(),
                    trailing: TextButton(
                      onPressed: () {
                        context.locale.languageCode == 'en'
                            ? context.setLocale(Locale('ar'))
                            : context.setLocale(Locale('en'));
                      },
                      child: Text(
                        context.locale.languageCode == 'en'
                            ? 'العربية'
                            : 'English',
                        style: TextStyles.subtitle.copyWith(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Second Settings Group
              SettingsCard(
                children: [
                  SettingsTile(
                    leadingIcon: SvgPicture.asset(AssetsManager.vehicleIcon),
                    title: 'profile.vehicle'.tr(),
                  ),
                  SettingsTile(
                    leadingIcon: SvgPicture.asset(AssetsManager.themeIcon),
                    title: 'profile.theme'.tr(),
                    trailing: TextButton(
                      onPressed: null,
                      child: Text(
                        'Dark mode',
                        style: TextStyles.subtitle.copyWith(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Third Settings Group
              SettingsCard(
                children: [
                  SettingsTile(
                    leadingIcon: SvgPicture.asset(AssetsManager.privacyPolicy),
                    title: 'profile.privacy'.tr(),
                  ),
                ],
              ),
              // logout settings card
              SettingsCard(
                children: [
                  SettingsTile(
                    leadingIcon: Icon(
                      Icons.logout,
                      color: AppColors.primaryColor,
                    ),
                    title: 'profile.logout'.tr(),
                    titleStyle: TextStyles.subtitle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileArc extends CustomPainter {
  ProfileArc({required this.fillColor});
  final Color fillColor;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 2);
    path.arcToPoint(Offset(0, size.height / 2),
        radius: const Radius.circular(10), largeArc: true);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
