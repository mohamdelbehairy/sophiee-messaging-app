import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/widgets/create_accont_widget/add_user_profile_image.dart';

class GroupsChatEditImage extends StatelessWidget {
  const GroupsChatEditImage({super.key, required this.groupModel});
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    var pickImage = context.read<PickImageCubit>();

    return BlocConsumer<PickImageCubit, PickImageStates>(
      listener: (context, state) {
        if (state is PickImageSucccess) {
          pickImage.selectedImage = state.image;
        }
      },
      builder: (context, state) {
        return AddUserProfileImage(
            size: size,
            pickImage: pickImage,
            enabled: true,
            top: size.width * .04,
            imageUrl: groupModel.groupImage!);
        // if (state is PickImageSucccess) {

        //   // return CircleAvatar(
        //   //     radius: size.height * .04,
        //   //     backgroundColor: Colors.transparent,
        //   //     backgroundImage: selectedImage != null
        //   //         ? FileImage(selectedImage!)
        //   //         : CachedNetworkImageProvider(groupModel.groupImage!)
        //   //             as ImageProvider);
        // } else {
        //   // return CircleAvatar(
        //   //     radius: size.height * .04,
        //   //     backgroundColor: Colors.transparent,
        //   //     backgroundImage:
        //   //         CachedNetworkImageProvider(groupModel.groupImage!));
        // }
      },
    );
  }
}
