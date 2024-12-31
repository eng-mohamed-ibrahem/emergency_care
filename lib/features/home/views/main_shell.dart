import 'package:easy_localization/easy_localization.dart';
import 'package:emergency_care/config/navigation/routes.dart';
import 'package:emergency_care/config/themes/text_styles.dart';
import 'package:emergency_care/core/constants/app_colors.dart';
import 'package:emergency_care/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key, required this.child});
  final Widget child;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widget.child,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        padding: EdgeInsets.zero,
        notchMargin: 16.sp,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                context.go(Routes.home.path);
                setState(() {
                  _selectedIndex = 0;
                });
              },
              icon: Column(
                children: [
                  SvgPicture.asset(
                    AppImages.homeSvgImage,
                    colorFilter: ColorFilter.mode(
                      _handleSelectedColor(0),
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    'home.title'.tr(),
                    style: TextStyles.subtitle.copyWith(
                      color: _handleSelectedColor(0),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                context.go(Routes.profile.path);
                setState(() {
                  _selectedIndex = 2;
                });
              },
              icon: Column(
                children: [
                  SvgPicture.asset(
                    AppImages.profileSvgImage,
                    colorFilter: ColorFilter.mode(
                      _handleSelectedColor(2),
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    'Profile',
                    style: TextStyles.subtitle.copyWith(
                      color: _handleSelectedColor(2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(Routes.contacts.path);
        },
        elevation: 0,
        backgroundColor: Colors.transparent,
        shape: const CircleBorder(),
        child: IconButton(
          style: IconButton.styleFrom(
            alignment: Alignment.center,
            fixedSize: const Size(60, 60),
            backgroundColor: _handleSelectedColor(1),
            shape: const CircleBorder(),
          ),
          onPressed: () {
            context.go(Routes.contacts.path);
            setState(() {
              _selectedIndex = 1;
            });
          },
          icon: const Icon(
            Icons.phone_in_talk_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }

  Color _handleSelectedColor(int index) {
    return _selectedIndex != index
        ? AppColors.iconUnselectedColor
        : AppColors.primaryColor;
  }
}
