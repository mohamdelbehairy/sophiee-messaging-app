import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/update_user_data/update_user_cubit_cubit.dart';

import '../cubit/pick_image/pick_image_cubit.dart';
import '../cubit/upload/upload_image/upload_image_cubit.dart';
import '../widgets/edit_profile_page_body/edit_profile_page_body.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var pickImage = context.read<PickImageCubit>();
    var updateUserData = context.read<UpdateUserDataCubit>();
    var uploadImage = context.read<UploadImageCubit>();
    var size = MediaQuery.sizeOf(context);

    return PopScope(
        canPop: false,
        child: EditprofilePageBody(
            updateUserData: updateUserData,
            uploadImage: uploadImage,
            size: size,
            pickImage: pickImage));
  }
}
