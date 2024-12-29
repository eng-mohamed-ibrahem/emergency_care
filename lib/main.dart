import 'package:easy_localization/easy_localization.dart';
import 'package:emergeny_care/core/utils/bloc_observer/cubit_observer.dart';
import 'package:emergeny_care/root_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();
  Bloc.observer = CubitObserver();

  runApp(
    EasyLocalization(
      path: 'lib/config/localization',
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: const Locale('en'),
      saveLocale: true,
      child: const RootApp(),
    ),
  );
}
