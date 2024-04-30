import 'package:sophiee/cubit/groups/high_light_group_message/hight_light_messages/high_light_messages_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/utils/widget/chats/high_light_page/high_light_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsChatHighLightPageBody extends StatelessWidget {
  const GroupsChatHighLightPageBody(
      {super.key,
      required this.hightLightMessage,
      required this.size,
      required this.groupModel});

  final HightLightMessagesCubit hightLightMessage;
  final Size size;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HightLightMessagesCubit, HightLightMessagesState>(
        builder: (context, state) {
      return ListView.builder(
          itemCount: hightLightMessage.hightLightMessageList.length,
          itemBuilder: (context, index) {
            return HighLightListViewItem(
                message: hightLightMessage.hightLightMessageList[index],
                size: size,
                groupModel: groupModel);
          });
    });
  }
}
