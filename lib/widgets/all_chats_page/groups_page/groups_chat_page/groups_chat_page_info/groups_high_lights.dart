import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/utils/navigation.dart';

import '../../../../../cubit/groups/high_light_group_message/hight_light_messages/high_light_messages_cubit.dart';
import '../../../../../models/group_model.dart';
import '../../../../../pages/chats/groups/groups_chat_page/groups_chat_highlights_page.dart';
import 'groups_chat_component.dart';

class GroupsHighlights extends StatelessWidget {
  const GroupsHighlights({
    super.key,
    required this.size,
    required this.isDark,
    required this.groupModel,
    required this.groupData,
  });

  final Size size;
  final bool isDark;
  final GroupModel groupModel;
  final GroupModel groupData;

  @override
  Widget build(BuildContext context) {
    return GroupsChatComponent(
        size: size,
        isDark: isDark,
        componentName: 'Highlights',
        onTap: () {
          context
              .read<HightLightMessagesCubit>()
              .getHightLightMessage(groupID: groupModel.groupID);
          Navigation.push(context,
              GroupsChatHighLightsPage(size: size, groupModel: groupData));
        });
  }
}
