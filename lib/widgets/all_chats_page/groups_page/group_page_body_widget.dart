import 'package:flutter/material.dart';

import '../../../models/group_model.dart';
import '../../../pages/chats/groups/groups_chat_page/groups_chat_page.dart';
import 'custom_create_group.dart';
import 'custom_my_groups.dart';
import 'package:get/get.dart' as getnav;

class GroupPageBodyWidget extends StatelessWidget {
  const GroupPageBodyWidget({super.key, required this.filteredGroups});

  final List<GroupModel> filteredGroups;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: filteredGroups.length + 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .9,
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4),
          itemBuilder: (context, index) {
            if (index == 0 && filteredGroups.isNotEmpty) {
              return const CustomCreateGroup();
            } else if (index != 0 && filteredGroups.isNotEmpty) {
              return GestureDetector(
                  onTap: () => getnav.Get.to(
                      () =>
                          GroupsChatPage(groupModel: filteredGroups[index - 1]),
                      transition: getnav.Transition.rightToLeft),
                  child: CustomMyGroups(groupModel: filteredGroups[index - 1]));
            } else {
              return const SizedBox();
            }
          }),
    );
  }
}
