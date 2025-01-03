import 'package:easy_localization/easy_localization.dart';
import 'package:emergency_care/config/navigation/routes.dart';
import 'package:emergency_care/config/themes/text_styles.dart';
import 'package:emergency_care/core/constants/app_colors.dart';
import 'package:emergency_care/core/constants/assets_manager.dart';
import 'package:emergency_care/core/utils/methods/methods.dart';
import 'package:emergency_care/features/home/viewmodel/main_shell_viewmodel/main_shell_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    kDebugPrint("rebuild main shell");
    return Scaffold(
      extendBody: true,
      body: child,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        padding: EdgeInsets.zero,
        notchMargin: 16.sp,
        child: BlocBuilder<MainShellViewmodel, MainShellViewmodelState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    context.go(Routes.home.path);
                    context.read<MainShellViewmodel>().changeSelectedIndex(0);
                  },
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.homeSvgIcon,
                        colorFilter: ColorFilter.mode(
                          _handleSelectedColor(context, 0),
                          BlendMode.srcIn,
                        ),
                      ),
                      Text(
                        'home.title'.tr(),
                        style: TextStyles.subtitle.copyWith(
                          color: _handleSelectedColor(context, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.go(Routes.profile.path);
                    context.read<MainShellViewmodel>().changeSelectedIndex(2);
                  },
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.profileSvgIcon,
                        colorFilter: ColorFilter.mode(
                          _handleSelectedColor(context, 2),
                          BlendMode.srcIn,
                        ),
                      ),
                      Text(
                        'profile.title'.tr(),
                        style: TextStyles.subtitle.copyWith(
                          color: _handleSelectedColor(context, 2),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
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
            backgroundColor: _handleSelectedColor(context, 1),
            shape: const CircleBorder(),
          ),
          onPressed: () {
            context.go(Routes.contacts.path);
            context.read<MainShellViewmodel>().changeSelectedIndex(1);
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

  Color _handleSelectedColor(BuildContext context, int tabIndex) {
    return context.read<MainShellViewmodel>().selectedIndex != tabIndex
        ? AppColors.iconUnselectedColor
        : AppColors.primaryColor;
  }
}
