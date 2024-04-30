import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGroupAppBarLeading extends StatelessWidget {
  const CreateGroupAppBarLeading(
      {super.key, required this.groupsMembersSelected});

  final GroupsMemberSelectedCubit groupsMembersSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
          context.read<PickImageCubit>().selectedImage = null;
          for (var friend
              in groupsMembersSelected.getGroupsMemberSelectedFriendsList) {
            groupsMembersSelected.deleteGroupsMemberSelectedFriends(
                selectedFriendID: friend);
          }
        },
        child: const Icon(Icons.arrow_back, color: Colors.white));
  }
}