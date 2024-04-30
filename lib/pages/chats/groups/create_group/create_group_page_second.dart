import 'package:sophiee/cubit/groups/create_groups/create_groups_cubit.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_page_second_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGroupPageSecond extends StatefulWidget {
  const CreateGroupPageSecond({super.key, required this.size});
  final Size size;

  @override
  State<CreateGroupPageSecond> createState() => _CreateGroupPageSecondState();
}

class _CreateGroupPageSecondState extends State<CreateGroupPageSecond> {
  late TextEditingController groupNameController;
  late TextEditingController descriptionController;
  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    groupNameController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    groupNameController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var groupsMembersSelected = context.read<GroupsMemberSelectedCubit>();
    var createGroup = context.read<CreateGroupsCubit>();
    var selectedImage = context.read<PickImageCubit>();
    return CreateGroupPageSecondBody(
        createGroup: createGroup,
        groupsMembersSelected: groupsMembersSelected,
        widget: widget,
        globalKey: globalKey,
        groupNameController: groupNameController,
        descriptionController: descriptionController,
        selectedImage: selectedImage);
  }
}
