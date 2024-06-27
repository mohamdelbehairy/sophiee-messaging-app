import 'package:sophiee/constants.dart';
import 'package:sophiee/widgets/on_boardring_page/on_boardring_page_item.dart';
import 'package:flutter/material.dart';

class OnBoardringPageBody extends StatelessWidget {
  const OnBoardringPageBody(
      {super.key,
      required this.controller,
      required this.size,
      this.onPageChanged});

  final PageController controller;
  final Size size;
  final void Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      onPageChanged: onPageChanged,
      children: [
        OnBoardringPageItem(
            size: size,
            imageUrl: onBoardringPageImageOneUrl,
            title: 'Discover New Friends',
            subTitle:
                'Encourage users to explore and meet new people\n Get ready for a new adventure! Explore a world\n full of opportunities to connect with\n new friend'),
        OnBoardringPageItem(
            size: size,
            imageUrl: onBoardringPageImageTwoUrl,
            title: 'Enjoy private conversation',
            subTitle:
                'Emphasize the privacy and security of messaging \n Implementing strong end-to-end encryption can\n safeguard messages so that only the intended \nrecipients can access and decipher them'),
        OnBoardringPageItem(
            size: size,
            imageUrl: onBoardringPageOneImageThreeUrl,
            title: 'Join Groups',
            subTitle:
                'Promote group chats and community engagement \n  Enhanced Interaction Group chats enable multiple\n      users to participate in conversations, encouraging\n lively discussions and exchanges of ideas \nwithin a community setting'),
      ],
    );
  }
}
