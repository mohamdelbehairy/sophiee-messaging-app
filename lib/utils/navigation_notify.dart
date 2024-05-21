import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_page/groups_chat_page.dart';
import 'package:sophiee/pages/story_view_page.dart';

import '../pages/chats/chat_page.dart';

class NavigationNotify {
  static void navigationNotification(
      RemoteMessage message, BuildContext context) {
    if (message.data['page'] == 'chat') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ChatPage(userID: message.data['senderId'])));
    }
    if (message.data['page'] == 'story') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  StoryViewPage(userID: message.data['senderId'])));
    }

    if (message.data['page'] == 'groupChat') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  GroupsChatPage(groupID: message.data['senderId'])));
    }
  }
}
