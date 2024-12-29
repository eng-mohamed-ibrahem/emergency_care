import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CubitObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // Get stack trace and location
    final location = _extractLocation(StackTrace.current);
    log("\n${bloc.runtimeType}: Triggered by $location\n ${change.currentState} \n>> ${change.nextState}");
    super.onChange(bloc, change);
  }

  String _extractLocation(StackTrace stackTrace) {
    final stackLines = stackTrace.toString().trim().split('\n');
    stackLines.retainWhere(
      (element) {
        // to filter the Stacktrace lines to be triggered by Your code
        return element.contains('package:emergeny_care');
      },
    );
    log(stackLines.join('\n'));
    if (stackLines.length > 1) {
      return stackLines.last.trim();
    }
    return 'Unknown Location';
  }

  @override
  void onClose(BlocBase bloc) {
    log("${bloc.runtimeType} closed");

    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    log("${bloc.runtimeType} created");

    super.onCreate(bloc);
  }
}
