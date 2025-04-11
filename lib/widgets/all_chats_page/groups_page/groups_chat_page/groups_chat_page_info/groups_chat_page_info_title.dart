import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/utils/navigation.dart';

import '../../../../../models/group_model.dart';
import '../../../../../pages/chats/groups/groups_chat_page/groups_chat_page_info_edit.dart';

class GroupsChatPageInfoTitle extends StatelessWidget {
  const GroupsChatPageInfoTitle(
      {super.key,
      required this.groupModel,
      required this.size,
      required this.isDark});

  final GroupModel groupModel;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: groupModel.groupName.length > 25 ? size.width * .5 : null,
            child: Text(groupModel.groupName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: isDark ? Colors.white : Colors.black))),
        const SizedBox(width: 8),
        if (groupModel.isMemberSettings ||
            groupModel.groupOwnerID == FirebaseAuth.instance.currentUser!.uid)
          GestureDetector(
              onTap: () => Navigation.push(context, GroupsChatPageInfoEditPage(groupModel: groupModel)),
              child: Icon(Icons.edit,
                  color: isDark ? Colors.white70 : Colors.grey,
                  size: size.height * .022))
      ],
    );
  }
}
