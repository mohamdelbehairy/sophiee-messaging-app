import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/groups/high_light_group_message/hight_light_messages/high_light_messages_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/utils/widget/chats/high_light_page/high_light_app_bar_text.dart';
import 'package:sophiee/utils/widget/chats/high_light_page/high_light_app_bar_action_icon.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_high_light_page/groups_high_light_page_body.dart';
import 'package:sophiee/utils/widget/chats/high_light_page/no_high_light_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsChatHighLightsPage extends StatelessWidget {
  const GroupsChatHighLightsPage(
      {super.key, required this.size, required this.groupModel});
  final Size size;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    var hightLightMessage = context.read<HightLightMessagesCubit>();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          title: HighLightPageAppBarText(size: size),
          actions: [
            HighLightAppBarActionIcon(
                size: size,
                hightLightMessage: hightLightMessage,
                groupModel: groupModel)
          ]),
      body: BlocBuilder<HightLightMessagesCubit, HightLightMessagesState>(
        builder: (context, state) {
          return SafeArea(
            child: hightLightMessage.hightLightMessageList.isEmpty
                ? NoHighLighMessages(size: size)
                : GroupsChatHighLightPageBody(
                    hightLightMessage: hightLightMessage,
                    size: size,
                    groupModel: groupModel),
          );
        },
      ),
    );
  }
}
