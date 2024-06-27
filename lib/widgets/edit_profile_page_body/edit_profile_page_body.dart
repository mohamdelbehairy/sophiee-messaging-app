import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/update_user_data/update_user_cubit_cubit.dart';
import 'package:sophiee/cubit/update_user_data/update_user_data_state.dart';

import '../../cubit/pick_image/pick_image_cubit.dart';
import '../../cubit/upload/upload_image/upload_image_cubit.dart';
import 'edit_profile_page_body_component.dart';

class EditprofilePageBody extends StatelessWidget {
  const EditprofilePageBody(
      {super.key,
      required this.updateUserData,
      required this.uploadImage,
      required this.size,
      required this.pickImage});

  final UpdateUserDataCubit updateUserData;
  final UploadImageCubit uploadImage;
  final Size size;
  final PickImageCubit pickImage;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserDataCubit, UpdateUserDataStates>(
      listener: (context, updateState) {
        if (updateState is UpdateUserDataLoading) {
          updateUserData.isLoading = updateState.isLoading;
        }
      },
      builder: (context, state) {
        return BlocConsumer<UploadImageCubit, UploadImageState>(
          listener: (context, uploadState) {
            if (uploadState is UploadImageLoading) {
              uploadImage.isLoading = uploadState.isLoading;
            }
          },
          builder: (context, state) {
            return EditProfilePageBodyComponent(
                uploadImage: uploadImage,
                updateUserData: updateUserData,
                size: size,
                pickImage: pickImage);
          },
        );
      },
    );
  }
}
