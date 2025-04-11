import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:sophiee/constants.dart';

import '../../../services/server_info.dart';

part 'story_notification_state.dart';

class StoryNotificationCubit extends Cubit<StoryNotificationState> {
  StoryNotificationCubit() : super(StoryNotificationInitial());

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // init story notification
  void initStoryNotification() {
    FirebaseMessaging.onMessage.listen((message) async {
      debugPrint('title: ${message.notification!.title}');
      debugPrint('body: ${message.notification!.body}');
      if (message.data['page'] == 'story') {
        await showStoryNotification(
            title: message.notification!.title.toString(),
            body: message.notification!.body.toString());
      }
    });
  }

  // send story notification
  Future<void> sendStoryNotification(
      {required String? receiverToken,
      required String senderId,
      required String senderName}) async {
    try {
      var data = {
        'to': receiverToken,
        'notification': {
          'title': senderName,
          'body': '${senderName.split(' ')[0]} add a new story',
        },
        'data': {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'status': 'done',
          'senderId': senderId,
          'page': 'story',
        },
      };

      await http.post(Uri.parse(ServerInfo.serverUrl),
          body: jsonEncode(data),
          headers: {
            'Content-Type': contentType,
            'Authorization': 'key=${ServerInfo.serverKey}',
          });
      emit(SendStoryNotificationSuccess());
    } catch (e) {
      emit(StoryNotificationFailure(errorMessage: e.toString()));
      debugPrint('error from send story notification method: ${e.toString()}');
    }
  }

  // show story notification
  Future<void> showStoryNotification(
      {required String title, required String body}) async {
    try {
      AndroidNotificationDetails android = const AndroidNotificationDetails(
          "com.android.sophiee", "myChannel",
          importance: Importance.max, priority: Priority.high);

      NotificationDetails details = NotificationDetails(android: android);

      await _flutterLocalNotificationsPlugin.show(
          DateTime.now().second, title, body, details);

      emit(ShowStoryNotificationSuccess());
    } catch (e) {
      emit(StoryNotificationFailure(errorMessage: e.toString()));
      debugPrint('error from show story notification method: ${e.toString()}');
    }
  }
}
