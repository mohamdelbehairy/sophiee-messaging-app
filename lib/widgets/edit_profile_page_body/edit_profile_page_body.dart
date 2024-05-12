import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/pick_image/pick_image_cubit.dart';
import '../../cubit/upload/upload_image/upload_image_cubit.dart';
import '../../cubit/user_date/store_user_date/store_user_date_cubit.dart';
import 'edit_profile_page_body_component.dart';

class EditprofilePageBody extends StatelessWidget {
  const EditprofilePageBody(
      {super.key,
      required this.storeUserData,
      required this.uploadImage,
      required this.size,
      required this.pickImage});

  final StoreUserDateCubit storeUserData;
  final UploadImageCubit uploadImage;
  final Size size;
  final PickImageCubit pickImage;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreUserDateCubit, StoreUserDateState>(
      listener: (context, storeState) {
        if (storeState is StoreUserDateLoading) {
          storeUserData.isLoading = storeState.isLoading;
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
                storeUserData: storeUserData,
                size: size,
                pickImage: pickImage);
          },
        );
      },
    );
  }
}
