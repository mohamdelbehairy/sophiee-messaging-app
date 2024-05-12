import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';

import '../cubit/pick_image/pick_image_cubit.dart';
import '../cubit/upload/upload_image/upload_image_cubit.dart';
import '../cubit/user_date/store_user_date/store_user_date_cubit.dart';
import '../widgets/edit_profile_page_body/edit_profile_page_body.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var pickImage = context.read<PickImageCubit>();
    var storeUserData = context.read<StoreUserDateCubit>();
    var uploadImage = context.read<UploadImageCubit>();

    return PopScope(
      onPopInvoked: (didPop) {
        if (pickImage.state is PickImageSucccess) {
          pickImage.emit(PickImageInitial());
          pickImage.selectedImage = null;
        }
      },
      child: EditprofilePageBody(
          storeUserData: storeUserData,
          uploadImage: uploadImage,
          size: size,
          pickImage: pickImage),
    );
  }
}

