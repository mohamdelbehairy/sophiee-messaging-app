import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_page_second_text_title.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_second_grid_view.dart';
import 'package:flutter/material.dart';

class CreateGroupSecondCardTwo extends StatelessWidget {
  const CreateGroupSecondCardTwo(
      {super.key, required this.size, required this.groupsMembersSelected});
  final Size size;
  final GroupsMemberSelectedCubit groupsMembersSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(.01),
            spreadRadius: 40,
            blurRadius: 40),
      ]),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.width * .02)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.width * .03),
            CreateGroupPageTwoTextTitle(size: size),
            SizedBox(height: size.width * .03),
            CreateGroupSecondGridView(
                size: size, groupMember: groupsMembersSelected),
          ],
        ),
      ),
    );
  }
}
