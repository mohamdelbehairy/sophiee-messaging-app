import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_state.dart';
import 'package:sophiee/pages/chats/groups/create_group/create_group_page_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getnav;

class CreateGroupFloatingActionButton extends StatelessWidget {
  const CreateGroupFloatingActionButton(
      {super.key, required this.groupsMembersSelected, required this.size});

  final GroupsMemberSelectedCubit groupsMembersSelected;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupsMemberSelectedCubit, GroupsMemberSelectedState>(
      builder: (context, state) {
        if (groupsMembersSelected
            .getGroupsMemberSelectedFriendsList.isNotEmpty) {
          return FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: kPrimaryColor,
              onPressed: () => getnav.Get.to(
                  () => CreateGroupPageSecond(size: size),
                  transition: getnav.Transition.leftToRight),
              child: const Icon(FontAwesomeIcons.arrowRight, color: Colors.white));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
