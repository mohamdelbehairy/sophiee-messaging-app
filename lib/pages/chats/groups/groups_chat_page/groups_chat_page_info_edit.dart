import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/groups/update_groups_details/update_groups_details_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_edit/editing_groups_details.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_edit/groups_chat_edit_pick_image.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_edit/groups_chat_page_edit_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class GroupsChatPageInfoEditPage extends StatefulWidget {
  const GroupsChatPageInfoEditPage({super.key, required this.groupModel});
  final GroupModel groupModel;

  @override
  State<GroupsChatPageInfoEditPage> createState() =>
      _GroupsChatPageInfoEditPageState();
}

class _GroupsChatPageInfoEditPageState
    extends State<GroupsChatPageInfoEditPage> {
  late TextEditingController groupNameController;
  late TextEditingController descriptionController;
  @override
  void initState() {
    super.initState();
    groupNameController =
        TextEditingController(text: widget.groupModel.groupName);
    descriptionController =
        TextEditingController(text: widget.groupModel.groupDescription);
  }

  @override
  void dispose() {
    super.dispose();
    groupNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var updateGroupDetails = context.read<UpdateGroupsDetailsCubit>();

    var selectedImage = context.read<PickImageCubit>();
    return BlocConsumer<UpdateGroupsDetailsCubit, UpdateGroupsDetailsState>(
      listener: (context, state) {
        if (state is UpdateGroupsImageLoading) {
          updateGroupDetails.isLoading = state.isLoading;
        }
        if (state is UpdateGroupsImageSuccess) {
          Navigator.pop(context);
        }
        if (state is UpdateGroupsInfoSuccess &&
            selectedImage.selectedImage == null) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: updateGroupDetails.isLoading,
          progressIndicator: Center(
              child: LoadingAnimationWidget.prograssiveDots(
                  color: kPrimaryColor, size: 50)),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: const Text('Edit',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal)),
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    selectedImage.selectedImage = null;
                  },
                  child: const Icon(Icons.arrow_back)),
              actions: [
                EditingGroupsDetails(
                    size: size,
                    updateGroupName: updateGroupDetails,
                    groupModel: widget.groupModel,
                    groupNameController: groupNameController,
                    discriptionController: descriptionController,
                    selectedImage: selectedImage)
              ],
            ),
            body: Column(
              children: [
                GroupsChatPageEditItems(
                    groupModel: widget.groupModel,
                    groupNameController: groupNameController,
                    descriptionController: descriptionController),
                const GroupsChatEditPickImage(),
                Divider(thickness: 1, color: Colors.grey.withOpacity(.2)),
              ],
            ),
          ),
        );
      },
    );
  }
}
