import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:sophiee/constants.dart';
import 'package:sophiee/pages/chats/chat_page.dart';

part 'message_notification_state.dart';

class MessageNotificationCubit extends Cubit<MessageNotificationState> {
  MessageNotificationCubit() : super(MessageNotificationInitial());

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // init follower notification
  void initMessageNotification() {
    debugPrint('init message notification');
    FirebaseMessaging.onMessage.listen((message) async {
      debugPrint('title: ${message.notification!.title}');
      debugPrint('body: ${message.notification!.body}');
      await showMessageNotification(
          title: message.notification!.title.toString(),
          body: message.notification!.body.toString());
    });
  }

  // send message notification
  Future<void> sendMessageNotification(
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
          'page': 'chat',
        }
      };

      await http.post(Uri.parse(serverUrl), body: jsonEncode(data), headers: {
        'Content-Type': contentType,
        'Authorization': 'key=$serverKey',
      });
      emit(SendMessageNotificationSuccess());
    } catch (e) {
      emit(MessageNotificationFailure(errorMessage: e.toString()));
      debugPrint(
          'error from send message notification method: ${e.toString()}');
    }
  }

  // show message notification
  Future<void> showMessageNotification(
      {required String title, required String body}) async {
    try {
      AndroidNotificationDetails android = const AndroidNotificationDetails(
          "com.example.sophiee", "myChannel",
          importance: Importance.max, priority: Priority.high);

      NotificationDetails details = NotificationDetails(android: android);

      await _flutterLocalNotificationsPlugin.show(
          DateTime.now().microsecondsSinceEpoch, title, body, details);

      emit(ShowMessageNotificationSuccess());
    } catch (e) {
      emit(MessageNotificationFailure(errorMessage: e.toString()));
      debugPrint(
          'error from show message notification method: ${e.toString()}');
    }
  }

  // navigate to chat page
  void navigationToChatPage(RemoteMessage message, BuildContext context) {
    debugPrint('data: ${message.data}');
    debugPrint('page: ${message.data['page']}');
    debugPrint('message: ${message.data['senderId']}');
    if (message.data['page'] == 'chat') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ChatPage(userID: message.data['senderId'])));
    }
  }

  // app state
  Future<void> appState(BuildContext context) async {
    // when app is closed
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      navigationToChatPage(message, context);
    }

    // when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      navigationToChatPage(message, context);
    });
  }
}
