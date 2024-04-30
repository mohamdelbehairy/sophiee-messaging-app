import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGroupPageTwoTextTitle extends StatelessWidget {
  const CreateGroupPageTwoTextTitle({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    var groupMember = context.read<GroupsMemberSelectedCubit>();
    return Padding(
        padding: EdgeInsets.only(left: size.width * .04),
        child:
            BlocBuilder<GroupsMemberSelectedCubit, GroupsMemberSelectedState>(
          builder: (context, state) {
            return Text(
                'Members: ${groupMember.getGroupsMemberSelectedFriendsList.length}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: size.width * .035,
                    fontWeight: FontWeight.w100));
          },
        ));
  }
}
