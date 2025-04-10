import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../utils/methods/navigation_notify.dart';


part 'notification_setting_state.dart';

class NotificationSettingCubit extends Cubit<NotificationSettingState> {
  NotificationSettingCubit() : super(NotificationSettingInitial());

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // init local notification
  Future<void> initLocalNotification() async {
    InitializationSettings settings = const InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/launcher_icon"),
        iOS: DarwinInitializationSettings());

    _flutterLocalNotificationsPlugin.initialize(settings,
        onDidReceiveNotificationResponse: (details) {});
    emit(InitLocalNotificationSuccess());
    await requestPermissions();
  }

  // request permission
  Future<void> requestPermissions() async {
    NotificationSettings settings = await FirebaseMessaging.instance
        .requestPermission(
            alert: true,
            announcement: true,
            badge: true,
            carPlay: true,
            criticalAlert: true,
            provisional: true,
            sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('user granted permission');
      emit(RequestPermissionsSuccess());
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('user granted provision permission');
    } else {
      debugPrint('user denied permission');
    }
  }

  // app state
  Future<void> appState(BuildContext context) async {
    // when app is closed
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      // ignore: use_build_context_synchronously
      NavigationNotify.navigationNotification(message, context);
    }

    // when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // ignore: use_build_context_synchronously
      NavigationNotify.navigationNotification(message, context);
    });
  }
}
