import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/utils/navigation.dart';

import '../../../cubit/story/story_cubit.dart';
import '../../../models/users_model.dart';
import '../../../pages/story/story_view_page.dart';
import 'item_top_component.dart';
import 'item_top_text.dart';

class ItemTopBody extends StatelessWidget {
  const ItemTopBody(
      {super.key,
      required this.data,
      required this.size,
      required this.isDark,
      required this.color});

  final UserModel data;

  final Size size;
  final bool isDark;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var isStory = context
        .read<StoryCubit>()
        .checkIsStory(friendId: data.userID, story: 'isStory');
    var isLive = context
        .read<StoryCubit>()
        .checkIsStory(friendId: data.userID, story: 'isLive');
    var story = context.read<StoryCubit>();
    return Column(
      children: [
        GestureDetector(
            onTap: () async {
              if (await isStory && !await isLive) {
                story.getStory(friendId: data.userID);
                await Future.delayed(const Duration(seconds: 1));
                // ignore: use_build_context_synchronously
                Navigation.push(context, StoryViewPage(userID: data.userID));
              }
              // if (await isLive) {
              //   getnav.Get.to(() => LivePage(liveID: data.userID),
              //       transition: getnav.Transition.downToUp);
              // }
            },
            child: ItemTopComponent(
                data: data, size: size, isDark: isDark, color: color)),
        const SizedBox(height: 2),
        ItemTopText(size: size, data: data, isDark: isDark)
      ],
    );
  }
}
