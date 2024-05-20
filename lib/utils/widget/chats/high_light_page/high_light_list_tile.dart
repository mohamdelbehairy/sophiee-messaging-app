import 'package:flutter/material.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/chats/high_light_page/high_light_list_tile_sub_title.dart';
import 'package:sophiee/utils/widget/chats/high_light_page/list_tile_postioned_friend_details.dart';

class HighLightListTile extends StatelessWidget {
  const HighLightListTile(
      {super.key,
      required this.message,
      required this.size,
      required this.user,
      this.groupModel,
      this.userData,
      required this.isDark,
      required this.userDataModel});
  final MessageModel message;
  final Size size;
  final UserModel user, userDataModel;
  final UserModel? userData;
  final GroupModel? groupModel;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
            padding: EdgeInsets.only(top: size.height * .032),
            child: ListTile(
                subtitle: HighLightListTileSubTitle(
                    user: user, message: message, size: size))),
        ListTilePostionedFriendDetails(
          userDataModel: userDataModel,
            isDark: isDark,
            userData: userData,
            size: size,
            user: user,
            message: message,
            groupModel: groupModel),
      ],
    );
  }
}
