import 'package:sophiee/cubit/groups/create_groups/create_groups_cubit.dart';
import 'package:sophiee/cubit/groups/create_groups/create_groups_state.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/pages/chats/groups/create_group/create_group_page_second.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_second_body_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/initial_state.dart';

class CreateGroupPageSecondBody extends StatelessWidget {
  const CreateGroupPageSecondBody(
      {super.key,
      required this.createGroup,
      required this.groupsMembersSelected,
      required this.widget,
      required this.globalKey,
      required this.groupNameController,
      required this.selectedImage,
      required this.descriptionController});

  final CreateGroupsCubit createGroup;
  final GroupsMemberSelectedCubit groupsMembersSelected;
  final CreateGroupPageSecond widget;
  final GlobalKey<FormState> globalKey;
  final TextEditingController groupNameController;
  final TextEditingController descriptionController;
  final PickImageCubit selectedImage;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateGroupsCubit, CreateGroupsState>(
      listener: (context, state) {
        if (state is UploadGroupImageLoading) {
          createGroup.isLoading = state.isLoading;
        }
        if (state is CreateGroupsSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);

          InitialState.initPickImageState(context);

          for (var friend
              in groupsMembersSelected.getGroupsMemberSelectedFriendsList) {
            groupsMembersSelected.deleteGroupsMemberSelectedFriends(
                selectedFriendID: friend);
          }
        }
      },
      builder: (context, state) {
        return CreateGroupSecondBodyComponenet(
            descriptionController: descriptionController,
            size: widget.size,
            createGroup: createGroup,
            globalKey: globalKey,
            groupNameController: groupNameController,
            groupsMembersSelected: groupsMembersSelected,
            selectedImage: selectedImage);
      },
    );
  }
}
