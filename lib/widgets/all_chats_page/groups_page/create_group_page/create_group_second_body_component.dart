import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/groups/create_groups/create_groups_cubit.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_add_group_info.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_second_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../utils/initial_state.dart';
import 'create_group_second_card_two.dart';

class CreateGroupSecondBodyComponenet extends StatelessWidget {
  const CreateGroupSecondBodyComponenet({
    super.key,
    required this.size,
    required this.createGroup,
    required this.globalKey,
    required this.groupNameController,
    required this.groupsMembersSelected,
    required this.selectedImage,
    required this.descriptionController,
  });

  final Size size;
  final CreateGroupsCubit createGroup;
  final GlobalKey<FormState> globalKey;
  final TextEditingController groupNameController;
  final TextEditingController descriptionController;
  final GroupsMemberSelectedCubit groupsMembersSelected;
  final PickImageCubit selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: size.width * -.02,
          backgroundColor: kPrimaryColor,
          title: const Text('New group',
              style: TextStyle(fontWeight: FontWeight.normal)),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                if (selectedImage.state is PickImageSucccess) {
                  InitialState.initPickImageState(context);
                }
              },
              child: const Icon(Icons.arrow_back)),
        ),
        body: !createGroup.isLoading
            ? Form(
                key: globalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CreateGroupAddGroupInfo(
                        size: size,
                        descriptionController: descriptionController,
                        groupNameController: groupNameController),
                    Expanded(
                        child: CreateGroupSecondCardTwo(
                            size: size,
                            groupsMembersSelected: groupsMembersSelected))
                  ],
                ),
              )
            : Center(
                child: LoadingAnimationWidget.prograssiveDots(
                    color: kPrimaryColor, size: size.height * .04)),
        floatingActionButton: !createGroup.isLoading
            ? CreateGroupPageSecondFloatingActionButton(
                globalKey: globalKey,
                selectedImage: selectedImage,
                createGroup: createGroup,
                groupsMembersSelected: groupsMembersSelected,
                groupNameController: groupNameController,
                descriptionController: descriptionController)
            : const SizedBox());
  }
}
