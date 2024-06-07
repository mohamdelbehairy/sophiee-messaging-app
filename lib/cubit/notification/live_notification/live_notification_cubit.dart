import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:sophiee/constants.dart';

part 'live_notification_state.dart';

class LiveNotificationCubit extends Cubit<LiveNotificationState> {
  LiveNotificationCubit() : super(LiveNotificationInitial());

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // init live notification
  void initLiveNotification() {
    FirebaseMessaging.onMessage.listen((message) async {
      debugPrint('title: ${message.notification!.title}');
      debugPrint('body: ${message.notification!.body}');
      if (message.data['page'] == 'live') {
        await showLiveNotification(
            title: message.notification!.title.toString(),
            body: message.notification!.body.toString());
      }
    });
  }

  // send live notification
  Future<void> sendLiveNotification(
      {required String? receiverToken,
      required String senderName,
      required String senderId}) async {
    try {
      var data = {
        'to': receiverToken,
        'notification': {
          'title': senderName,
          'body': '${senderName.split(' ')[0]} is starting live now',
        },
        'data': {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'status': 'done',
          'senderId': senderId,
          'page': 'live',
        },
      };
      await http.post(Uri.parse(serverUrl), body: jsonEncode(data), headers: {
        'Content-Type': contentType,
        'Authorization': 'key=$serverKey',
      });
      emit(SendLiveNotificationSuccess());
    } catch (e) {
      emit(LiveNotificationFailure(errorMessage: e.toString()));
      debugPrint('error from send live notification: $e');
    }
  }

  // show live notification
  Future<void> showLiveNotification(
      {required String title, required String body}) async {
    try {
      AndroidNotificationDetails android = const AndroidNotificationDetails(
          'Live', 'live',
          priority: Priority.high, importance: Importance.max);

      NotificationDetails notificationDetails =
          NotificationDetails(android: android);
      await _flutterLocalNotificationsPlugin.show(
          DateTime.now().second, title, body, notificationDetails);
      emit(ShowLiveNotificationSuccess());
    } catch (e) {
      emit(LiveNotificationFailure(errorMessage: e.toString()));
      debugPrint('error from show live notification: $e');
    }
  }
}
