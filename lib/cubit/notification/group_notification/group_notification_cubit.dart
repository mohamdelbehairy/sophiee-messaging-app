import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:sophiee/constants.dart';

part 'group_notification_state.dart';

class GroupNotificationCubit extends Cubit<GroupNotificationState> {
  GroupNotificationCubit() : super(GroupNotificationInitial());

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // init group message notification
  void initGroupMessageNotification() {
    FirebaseMessaging.onMessage.listen((message) async {
      debugPrint('title: ${message.notification!.title}');
      debugPrint('body: ${message.notification!.body}');
      
      if (message.data['page'] == 'groupChat ') {
        await showGroupMessageNotification(
            title: message.notification!.title.toString(),
            body: message.notification!.body.toString());
      }
    });
  }

  // send group message notification
  Future<void> sendGroupMessageNotification(
      {required String? receiverToken,
      required String senderName,
      required String message,
      required String senderId}) async {
    try {
      var data = {
        'to': receiverToken,
        'notification': {
          'title': senderName,
          'body': message,
        },
        'data': {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'status': 'done',
          'senderId': senderId,
          'page': 'groupChat',
        }
      };

      await http.post(
        Uri.parse(serverUrl),
        body: jsonEncode(data),
        headers: {
          'Content-Type': contentType,
          'Authorization': 'key=$serverKey',
        },
      );
      emit(SendGroupNotificationSuccess());
    } catch (e) {
      emit(GroupNotificationFailure(errorMessage: e.toString()));
      debugPrint(
          'error from send group message notification method: ${e.toString()}');
    }
  }

  // show group message notification
  Future<void> showGroupMessageNotification(
      {required String title, required String body}) async {
    try {
      AndroidNotificationDetails android = const AndroidNotificationDetails(
          "com.example.sophiee", "myChannel",
          importance: Importance.max, priority: Priority.high);

      NotificationDetails notificationDetails =
          NotificationDetails(android: android);

      await _flutterLocalNotificationsPlugin.show(
          DateTime.now().microsecondsSinceEpoch,
          title,
          body,
          notificationDetails);
      emit(ShowGroupNotificationSuccess());
    } catch (e) {
      emit(GroupNotificationFailure(errorMessage: e.toString()));
      debugPrint(
          'error from show group message notification method: ${e.toString()}');
    }
  }
}
