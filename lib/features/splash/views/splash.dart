import 'package:emergency_care/config/navigation/routes.dart';
import 'package:emergency_care/core/constants/app_images.dart';
import 'package:emergency_care/core/utils/methods/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    kDebugPrint("Splash Screen");
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.go(Routes.login.path);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Image.asset(
      AppImages.splash,
      fit: BoxFit.contain,
    );
  }
}
