import 'package:flutter/material.dart';

abstract class CachedImages {
  static const _pngImages = [
    "assets/images/chat.png",
    "assets/images/empty.png",
    "assets/images/google-icon.png",
    "assets/images/high_splash.png",
    "assets/images/highLightMessage.png",
    "assets/images/low_splash.png",
    "assets/images/network-error.png",
    "assets/images/no-chats.png",
    "assets/images/no-group-chat.png",
    "assets/images/notification.png",
    "assets/images/on-boardring-page-1.png",
    "assets/images/on-boardring-page-2.png",
    "assets/images/on-boardring-page-3.png",
    "assets/images/phone-number.png",
    "assets/images/profile_lock.png",
    "assets/images/provider-auth.png",
    "assets/images/search_friends.png",
    "assets/images/signPage.jpg"
  ];

  static Future<void> loadImages(BuildContext context) async {
    for (var image in _pngImages) {
      await precacheImage(AssetImage(image), context);
    }
  }
}
