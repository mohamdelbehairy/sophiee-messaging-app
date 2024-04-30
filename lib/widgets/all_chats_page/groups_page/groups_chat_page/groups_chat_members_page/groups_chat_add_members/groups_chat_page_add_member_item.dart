import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/pages/chats/groups/groups_add_member_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getnav;

class GroupsChatPageAddMemberItem extends StatelessWidget {
  const GroupsChatPageAddMemberItem(
      {super.key, required this.size, required this.groupModel});
  final Size size;

  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .03),
      child: GestureDetector(
        onTap: () => getnav.Get.to(
            () => GroupsAddMemberPage(size: size, groupModel: groupModel),
            transition: getnav.Transition.leftToRight),
        child: Row(
          children: [
            Icon(FontAwesomeIcons.plus,
                color: Colors.blue, size: size.height * .025),
            SizedBox(width: size.width * .025),
            Text('Add a member',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: size.height * .018,
                    fontWeight: FontWeight.normal))
          ],
        ),
      ),
    );
  }
}
