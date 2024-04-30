import 'package:sophiee/cubit/groups/get_groups_member/get_groups_member_cubit.dart';
import 'package:sophiee/cubit/groups/get_groups_member/get_groups_member_state.dart';
import 'package:sophiee/cubit/groups/high_light_group_message/hight_light_messages/high_light_messages_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_page/groups_chat_highlights_page.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_page/groups_chat_media_fiels_page.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_page/groups_chat_members_page.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_info/groups_chat_page_created_info.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_info/groups_chat_page_info_list_tile.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_info/groups_chat_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

class GroupsChatPageInfoDetails extends StatelessWidget {
  const GroupsChatPageInfoDetails(
      {super.key, required this.groupModel, required this.user});
  final GroupModel groupModel;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Card(
        color: Colors.white,
        child: Padding(
          padding:
              EdgeInsets.only(left: 0.0, right: 0.0, top: size.width * .015),
          child: BlocBuilder<GetGroupsMemberCubit, GetGroupsMemberState>(
            builder: (context, state) {
              if (state is GetGroupsMemberSuccess &&
                  state.groupsList.isNotEmpty) {
                final groupID = groupModel.groupID;
                final groupData = state.groupsList
                    .firstWhere((element) => element.groupID == groupID);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GroupsChatPageInfoListTile(groupModel: groupData),
                    SizedBox(height: size.height * .01),
                    GroupsChatPageCreatedInfo(size: size, groupData: groupData),
                    Divider(thickness: 2, color: Colors.grey.withOpacity(.1)),
                    SizedBox(height: size.height * .008),
                    GroupsChatComponent(
                        componentName: 'Group Members',
                        onTap: () => getnav.Get.to(
                            () => GroupsChatMembersPage(groupModel: groupData),
                            transition: getnav.Transition.leftToRight)),
                    SizedBox(height: size.height * .008),
                    GroupsChatComponent(
                        componentName: 'Highlights',
                        onTap: () {
                          context
                              .read<HightLightMessagesCubit>()
                              .getHightLightMessage(
                                  groupID: groupModel.groupID);
                          getnav.Get.to(
                              () => GroupsChatHighLightsPage(
                                  size: size, groupModel: groupData),
                              transition: getnav.Transition.leftToRight);
                        }),
                    SizedBox(height: size.height * .008),
                    GroupsChatComponent(
                        componentName: 'Media fiels',
                        onTap: () => getnav.Get.to(
                            () => GroupsChatMediaFilesPage(
                                groupModel: groupData, size: size),
                            transition: getnav.Transition.leftToRight)),
                    SizedBox(height: size.height * .008),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
