import 'package:flutter/material.dart';
import 'package:get/get.dart' as getnav;

import '../../pages/friends_page.dart';
import '../../utils/widget/no_result_found.dart';

class NoChatsFounded extends StatelessWidget {
  const NoChatsFounded({super.key, required this.size, required this.isDark, this.image});

  final Size size;
  final bool isDark;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return CustomNoResultFound(
      image: image,
      textOne: 'No Conversations',
      textTwo:
          'You didn\'t have any conversations yet.\nplease start a conversation.',
      widget: TextButton(
          onPressed: () => getnav.Get.to(
              () => FriendsPage(size: size, isDark: isDark),
              transition: getnav.Transition.rightToLeft),
          child:
              const Text('Chat People', style: TextStyle(color: Colors.blue))),
    );
  }
}
