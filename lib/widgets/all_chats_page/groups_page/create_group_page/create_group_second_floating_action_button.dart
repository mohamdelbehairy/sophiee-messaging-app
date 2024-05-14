import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/groups/create_groups/create_groups_cubit.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';

class CreateGroupPageSecondFloatingActionButton extends StatelessWidget {
  const CreateGroupPageSecondFloatingActionButton({
    super.key,
    required this.globalKey,
    required this.selectedImage,
    required this.createGroup,
    required this.groupsMembersSelected,
    required this.groupNameController,
    required this.descriptionController,
  });

  final GlobalKey<FormState> globalKey;
  final PickImageCubit selectedImage;
  final CreateGroupsCubit createGroup;
  final GroupsMemberSelectedCubit groupsMembersSelected;
  final TextEditingController groupNameController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    File? imageFile;
    return BlocListener<PickImageCubit, PickImageStates>(
      listener: (context, state) {
        if (state is PickImageSucccess) {
          debugPrint('pick image: ${state.image}');
          imageFile = state.image;
        }
      },
      child: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: kPrimaryColor,
        onPressed: () async {
          if (globalKey.currentState!.validate()) {
            globalKey.currentState!.save();

            // final File? selectedImageFile = selectedImage.selectedImage;
            if (imageFile != null) {
              String groupImageUrl =
                  await createGroup.uploadGroupImage(groupImageFile: imageFile);
              await createGroup.createGroups(
                usersID:
                    groupsMembersSelected.getGroupsMemberSelectedFriendsList,
                groupName: groupNameController.text,
                groupDescription: descriptionController.text,
                groupImageFile: imageFile,
                groupImageUrl: groupImageUrl,
              );
            } else {
              String groupImageUrl =
                  await createGroup.uploadGroupImage(groupImageFile: null);
              await createGroup.createGroups(
                usersID:
                    groupsMembersSelected.getGroupsMemberSelectedFriendsList,
                groupName: groupNameController.text,
                groupDescription: descriptionController.text,
                groupImageFile: null,
                groupImageUrl: groupImageUrl,
              );
            }
            groupNameController.clear();
            for (var friend
                in groupsMembersSelected.getGroupsMemberSelectedFriendsList) {
              groupsMembersSelected.deleteGroupsMemberSelectedFriends(
                  selectedFriendID: friend);
            }
          }
        },
        child: const Icon(Icons.done, color: Colors.white),
      ),
    );
  }
}
