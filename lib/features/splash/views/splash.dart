import 'package:emergency_care/config/navigation/routes.dart';
import 'package:emergency_care/core/constants/assets_manager.dart';
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
      AssetsManager.splash,
      fit: BoxFit.contain,
    );
  }
}
