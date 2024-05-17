import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/pages/story_view_page.dart';

import '../pages/chats/chat_page.dart';

class NavigationNotify {
  static void navigationNotification(
      RemoteMessage message, BuildContext context) {
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
    if (message.data['page'] == 'story') {
      debugPrint('message data: ${message.data}');
      debugPrint('sender id: ${message.data['senderId']}');
      debugPrint('message data page: ${message.data['page']}');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  StoryViewPage(userID: message.data['senderId'])));
    }
  }
}
