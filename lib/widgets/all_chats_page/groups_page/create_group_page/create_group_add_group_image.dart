import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants.dart';
import '../../../create_accont_widget/add_user_profile_image.dart';

class CreateGroupAddGroupImage extends StatelessWidget {
  const CreateGroupAddGroupImage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pickImage = context.read<PickImageCubit>();
    return GestureDetector(
      onTap: () async {
        await pickImage.pickImage(source: ImageSource.gallery);
      },
      child: BlocBuilder<PickImageCubit, PickImageStates>(
        builder: (context, state) {
          return AddUserProfileImage(
              imageUrl: defaultImageUrl,
              top: size.height * .01,
              enabled: true,
              size: size,
              pickImage: pickImage);
        },
      ),
    );
  }
}
