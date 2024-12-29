import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showSnackBar(
  BuildContext context, {
  required String message,
  SnackBarAction? action,
  Color? backgroundColor,
  Duration? duration,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      action: action,
    ),
  );
}

/// dialog for logout
void showLogoutDialog(BuildContext context, {required VoidCallback onConfirm}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('auth.logout'.tr(),
            style: Theme.of(context).textTheme.titleLarge),
        content: Text('auth.logout_msg'.tr()),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('core.cancel'.tr()),
          ),
          TextButton(
            onPressed: onConfirm,
            child: Text(
              'auth.logout'.tr(),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.red,
                  ),
            ),
          ),
        ],
      );
    },
  );
}

/// show loading dialog with progress indicator
void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return PopScope(
        canPop: false,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Card(
            elevation: 2,
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * .3,
              height: MediaQuery.sizeOf(context).height * .12,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          ),
        ),
      );
    },
  );
}

/// print while debugging only
///
///
///
///  another way
/// ```dart
/// assert(() {
///   print(message);
///   return true;
/// }());
/// ```
void kDebugPrint(String message) {
  if (kDebugMode) {
    print(message);
  }
}

/// show model bottom sheet
showSheet(BuildContext context, {required Widget content}) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    isScrollControlled: true,
    enableDrag: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(10),
      ),
    ),
    constraints: BoxConstraints(
        minHeight: MediaQuery.sizeOf(context).height * .15,
        minWidth: double.infinity),
    builder: (context) {
      return content;
    },
  );
}
