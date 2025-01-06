import 'dart:io';

import 'package:emergency_care/config/navigation/pages.dart';
import 'package:emergency_care/config/navigation/routes.dart';
import 'package:emergency_care/features/main_shell/viewmodel/main_shell_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();
  static final GlobalKey<NavigatorState> _parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    initialLocation: Routes.splash.path,
    navigatorKey: _parentNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.splash.path,
        name: Routes.splash.name,
        pageBuilder: (context, state) => pageBuilder(
          context,
          state,
          Splash(),
        ),
      ),
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        pageBuilder: (context, state) => pageBuilder(
          context,
          state,
          LoginScreen(),
        ),
      ),
      GoRoute(
        path: Routes.register.path,
        name: Routes.register.name,
        pageBuilder: (context, state) => pageBuilder(
          context,
          state,
          RegisterScreen(),
        ),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => MainShellViewmodel(),
            child: MainShell(child: child),
          );
        },
        routes: [
          GoRoute(
            path: Routes.home.path,
            name: Routes.home.name,
            pageBuilder: (context, state) => pageBuilder(
              context,
              state,
              HomeScreen(),
            ),
            routes: [
              GoRoute(
                path: Routes.registerVehicle.path,
                name: Routes.registerVehicle.name,
                parentNavigatorKey: _parentNavigatorKey,
                pageBuilder: (context, state) => pageBuilder(
                  context,
                  state,
                  RegisterVehicle(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: Routes.contacts.path,
            name: Routes.contacts.name,
            pageBuilder: (context, state) => pageBuilder(
              context,
              state,
              ContactsScreen(),
            ),
          ),
          GoRoute(
            path: Routes.profile.path,
            name: Routes.profile.name,
            pageBuilder: (context, state) => pageBuilder(
              context,
              state,
              ProfileScreen(),
            ),
            routes: [
              GoRoute(
                path: Routes.editProfile.path,
                name: Routes.editProfile.name,
                parentNavigatorKey: _parentNavigatorKey,
                pageBuilder: (context, state) => pageBuilder(
                  context,
                  state,
                  EditProfileScreen(),
                ),
              ),
              GoRoute(
                path: Routes.editVehcile.path,
                name: Routes.editVehcile.name,
                parentNavigatorKey: _parentNavigatorKey,
                pageBuilder: (context, state) => pageBuilder(
                  context,
                  state,
                  EditVehicleScreen(),
                ),
                redirect: (context, state) {
                  //* redirect to *register vehicle* incase it doesn't register vehicle yet
                  return null;
                },
              ),
            ],
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => pageBuilder(
      context,
      state,
      Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      ),
    ),
  );

  static Page pageBuilder(
      BuildContext context, GoRouterState state, Widget route) {
    return Platform.isIOS
        ? CupertinoPage(
            child: route,
          )
        : MaterialPage(
            child: route,
          );
  }
}
