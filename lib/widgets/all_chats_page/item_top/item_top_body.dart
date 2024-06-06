import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

import '../../../cubit/story/story_cubit.dart';
import '../../../models/users_model.dart';
import '../../../pages/story/story_view_page.dart';
import 'item_top_component.dart';
import 'item_top_text.dart';

class ItemTopBody extends StatelessWidget {
  const ItemTopBody(
      {super.key,
      required this.user,
      required this.data,
      required this.size,
      required this.isDark,
      required this.color});

  final UserModel user;
  final UserModel data;
  final Size size;
  final bool isDark;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var isStory = context
        .read<StoryCubit>()
        .checkIsStory(friendId: user.userID, story: 'isStory');
    var isLive = context
        .read<StoryCubit>()
        .checkIsStory(friendId: user.userID, story: 'isLive');
    return Column(
      children: [
        GestureDetector(
            onTap: () async {
              if (await isStory && !await isLive) {
                getnav.Get.to(() => StoryViewPage(userID: user.userID),
                    transition: getnav.Transition.downToUp);
              }
              if (await isLive) {}
            },
            child: ItemTopComponent(
                data: data, size: size, isDark: isDark, color: color)),
        const SizedBox(height: 2),
        ItemTopText(size: size, data: data, isDark: isDark)
      ],
    );
  }
}
