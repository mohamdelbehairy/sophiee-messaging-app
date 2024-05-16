import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:sophiee/constants.dart';

part 'follower_notification_state.dart';

class FollowerNotificationCubit extends Cubit<FolloweNotificationState> {
  FollowerNotificationCubit() : super(FolloweNotificationInitial());

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // init follower notification
  void initFollowerNotification() {
    FirebaseMessaging.onMessage.listen((message) async {
      debugPrint('title: ${message.notification!.title}');
      debugPrint('body: ${message.notification!.body}');
      await showFollowerNotification(
          title: message.notification!.title.toString(),
          body: message.notification!.body.toString());
    });
  }

  // send follower notification
  Future<void> sendFollowerNotification(
      {required String? followingToken, required String folowingName}) async {
    try {
      var data = {
        'to': followingToken,
        'notification': {
          'title': folowingName,
          'body': '${folowingName.split(' ')[0]} is starting follow you',
        },
        'data': {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'status': 'done',
          'page': 'follower',
        }
      };
      await http.post(Uri.parse(serverUrl), body: jsonEncode(data), headers: {
        'Content-Type': contentType,
        'Authorization': 'key=$serverKey'
      });
      emit(SendFollowerNotificationSuccess());
    } catch (e) {
      emit(FolloweNotificationFailure(errorMessage: e.toString()));
      debugPrint(
          'error from send follower notification method: ${e.toString()}');
    }
  }

  // show follower notification
  Future<void> showFollowerNotification(
      {required String title, required String body}) async {
    AndroidNotificationDetails android = const AndroidNotificationDetails(
        "com.example.sophiee", "myChannel",
        importance: Importance.max, priority: Priority.high);

    NotificationDetails details = NotificationDetails(android: android);

    await _flutterLocalNotificationsPlugin.show(0, title, body, details);
    emit(ShowFollowerNotificationSuccess());
  }
}
