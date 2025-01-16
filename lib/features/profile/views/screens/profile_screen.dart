import 'package:easy_localization/easy_localization.dart';
import 'package:emergency_care/config/navigation/routes.dart';
import 'package:emergency_care/config/themes/text_styles.dart';
import 'package:emergency_care/core/constants/app_colors.dart';
import 'package:emergency_care/core/constants/assets_manager.dart';
import 'package:emergency_care/features/main_shell/viewmodel/main_shell_viewmodel.dart';
import 'package:emergency_care/features/profile/views/widgets/settings_card.dart';
import 'package:emergency_care/features/profile/views/widgets/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Picture
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipPath(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  clipper: WaveClipper(),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.28,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                    ),
                    alignment: Alignment.bottomCenter,
                    // child:
                  ),
                ),
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
                    Positioned(
                      right: 0,
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
                  leadingIcon: SvgPicture.asset(AssetsManager.profileEditIcon),
                  title: 'profile.edit'.tr(),
                  onTap: () {
                    context.goNamed(Routes.editProfile.name);
                  },
                ),
                SettingsTile(
                  leadingIcon: SvgPicture.asset(AssetsManager.languageIcon),
                  title: 'profile.lang'.tr(),
                  trailing: TextButton(
                    onPressed: () {
                      Locale currentLang = context.locale.languageCode == 'en'
                          ? Locale('ar')
                          : Locale('en');
                      context
                          .read<MainShellViewmodel>()
                          .changeLanguage(currentLang);
                      context.setLocale(currentLang);
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
                  onTap: () {
                    context.goNamed(Routes.editVehcile.name);
                  },
                ),
                SettingsTile(
                  leadingIcon: SvgPicture.asset(AssetsManager.themeIcon),
                  title: 'profile.theme'.tr(),
                  trailing: TextButton(
                    onPressed: null,
                    child: Text(
                      'profile.mode'.tr(),
                      style: TextStyles.subtitle.copyWith(
                        color: Colors.blue.shade200,
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
                  onTap: () {
                    // handle logout
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // Start at top-left and draw straight line to bottom-left
    path.lineTo(0, size.height * 0.75); // Move starting point down

    // Create the wave at bottom
    var firstControlPoint =
        Offset(size.width / 4, size.height * 0.8); // Move control point down
    var firstEndPoint =
        Offset(size.width / 2, size.height * 0.75); // Move end point down
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width * 0.75, size.height * 0.7); // Move control point down
    var secondEndPoint =
        Offset(size.width, size.height * 0.75); // Move end point down
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    // Complete the path
    path.lineTo(size.width, 0); // Draw line to top-right
    path.lineTo(0, 0); // Draw line to top-left
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
