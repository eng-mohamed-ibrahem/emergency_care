import 'package:easy_localization/easy_localization.dart';
import 'package:emergency_care/config/navigation/app_navigation.dart';
import 'package:emergency_care/config/themes/app_theme.dart';
import 'package:emergency_care/core/dependency_injection/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: setUpDependencies(),
      builder: (context, snapshot) {
        return ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              title: "Emergency Care",
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: const TextScaler.linear(1)),
                  child: child!,
                );
              },
              routerConfig: AppNavigation.router,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: AppTheme.lightTheme,
            );
          },
        );
      },
    );
  }
}
