import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_page/show_group_image_page.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_info/groups_chat_page_info_list_tile_sub_title.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getnav;

import 'groups_chat_page_info_title.dart';

class GroupsChatPageInfoListTile extends StatelessWidget {
  const GroupsChatPageInfoListTile(
      {super.key,
      required this.groupModel,
      required this.size,
      required this.isDark});
  final GroupModel groupModel;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: GestureDetector(
            onTap: () => getnav.Get.to(
                () => ShowGroupImagePage(groupModel: groupModel, size: size),
                transition: getnav.Transition.downToUp),
            child: CircleAvatar(
                radius: size.height * .03,
                backgroundColor: Colors.transparent,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: FancyShimmerImage(
                        boxFit: BoxFit.cover,
                        shimmerBaseColor:
                            isDark ? Colors.white12 : Colors.grey.shade300,
                        shimmerHighlightColor:
                            isDark ? Colors.white24 : Colors.grey.shade100,
                        imageUrl: groupModel.groupImage!)))),
        title: GroupsChatPageInfoTitle(
            groupModel: groupModel, size: size, isDark: isDark),
        subtitle: GroupsChatPageInfoTitleSubTitle(groupModel: groupModel, size: size,isDark: isDark));
  }
}
