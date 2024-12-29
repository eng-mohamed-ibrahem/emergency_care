import 'dart:io';
import 'dart:ui';

import 'package:emergeny_care/core/service/notification_service/notification_background_service_interface.dart';
import 'package:emergeny_care/core/utils/methods/methods.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

// The callback function should always be a top-level or static function.
@pragma('vm:entry-point')
void startCallback() {
  kDebugPrint('startCallback');
  FlutterForegroundTask.setTaskHandler(NotificationHandler());
}

class ForegroundTaskNotificationService
    implements NotificationBackgroundService {
  @override
  void initializeAndStartService() async {
    // Initialize port for communication between TaskHandler and UI.
    FlutterForegroundTask.initCommunicationPort();
    _requestPermissions();
    _initService();

    _startService();
  }

  Future<void> _requestPermissions() async {
    // Android 13+, you need to allow notification permission to display foreground service notification.
    //
    // iOS: If you need notification, ask for permission.
    final NotificationPermission notificationPermission =
        await FlutterForegroundTask.checkNotificationPermission();
    if (notificationPermission != NotificationPermission.granted) {
      await FlutterForegroundTask.requestNotificationPermission();
    }

    if (Platform.isAndroid) {
      // Android 12+, there are restrictions on starting a foreground service.
      //
      // To restart the service on device reboot or unexpected problem, you need to allow below permission.
      if (!await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
        // This function requires `android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` permission.
        await FlutterForegroundTask.requestIgnoreBatteryOptimization();
      }

      // Use this utility only if you provide services that require long-term survival,
      // such as exact alarm service, healthcare service, or Bluetooth communication.
      //
      // This utility requires the "android.permission.SCHEDULE_EXACT_ALARM" permission.
      // Using this permission may make app distribution difficult due to Google policy.
      if (!await FlutterForegroundTask.canScheduleExactAlarms) {
        // When you call this function, will be gone to the settings page.
        // So you need to explain to the user why set it.
        await FlutterForegroundTask.openAlarmsAndRemindersSettings();
      }
    }
  }

  void _initService() {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: "foreground_service_notification",
        channelName: 'Foreground Service Notification',
        channelDescription:
            'This notification appears when the foreground service is running.',
        onlyAlertOnce: true,
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: false,
        playSound: false,
      ),
      foregroundTaskOptions: ForegroundTaskOptions(
        eventAction: ForegroundTaskEventAction.nothing(),
        autoRunOnBoot: true,
        autoRunOnMyPackageReplaced: true,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );
  }

  Future<ServiceRequestResult> _startService() async {
    if (await FlutterForegroundTask.isRunningService) {
      return await FlutterForegroundTask.restartService();
    } else {
      kDebugPrint("start service");
      return await FlutterForegroundTask.startService(
        serviceId: 256,
        notificationTitle: 'Better One',
        notificationText: 'We Are Here, For You',
        notificationIcon: null,
        // notificationButtons: [
        //   const NotificationButton(id: 'btn_hello', text: 'hello'),
        // ],
        // notificationInitialRoute: '/second',
        callback: startCallback,
      );
    }
  }

  Future<ServiceRequestResult> _stopService() {
    return FlutterForegroundTask.stopService();
  }

  @override
  void muteNotification() async {
    await _stopService();
  }

  @override
  void stopService() async {
    await _stopService();
  }

  @override
  void unMuteNotification() async {
    await _startService();
  }
}

class NotificationHandler extends TaskHandler {
  // Called when the task is started.
  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
    kDebugPrint('onStart(starter: ${starter.name})');
    DartPluginRegistrant.ensureInitialized();
  }

  // Called based on the eventAction set in ForegroundTaskOptions.
  @override
  void onRepeatEvent(DateTime timestamp) {
    // Update notification content.
    // FlutterForegroundTask.updateService(
    //   notificationTitle: 'Hello NotificationHandler :)',
    //   notificationText: 'count data',
    // );
    kDebugPrint("on Repeat Event");
  }

  // Called when the task is destroyed.
  @override
  Future<void> onDestroy(DateTime timestamp) async {
    kDebugPrint('onDestroy');
  }

  // Called when data is sent using `FlutterForegroundTask.sendDataToTask`.
  @override
  void onReceiveData(Object data) {
    // data as String
    kDebugPrint('onReceiveData: $data');
    if (data == "increment") {
      // _incrementCount();
    }
  }

  // Called when the notification button is pressed.
  @override
  void onNotificationButtonPressed(String id) {
    kDebugPrint('onNotificationButtonPressed: $id');
  }

  // Called when the notification itself is pressed.
  @override
  void onNotificationPressed() {
    kDebugPrint('onNotificationPressed');
  }

  // Called when the notification itself is dismissed.
  @override
  void onNotificationDismissed() {
    kDebugPrint('onNotificationDismissed');
  }
}
