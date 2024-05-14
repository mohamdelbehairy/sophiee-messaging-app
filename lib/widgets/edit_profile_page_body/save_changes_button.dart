import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';
import 'package:sophiee/cubit/update_user_data/update_user_data_state.dart';
import 'package:sophiee/cubit/user_date/image/store_image/store_image_cubit.dart';

import '../../cubit/update_user_data/update_user_cubit_cubit.dart';
import '../../cubit/upload/upload_image/upload_image_cubit.dart';
import '../../models/users_model.dart';
import 'custom_save_changes_button.dart';

class SaveChangesButton extends StatelessWidget {
  const SaveChangesButton(
      {super.key,
      required this.fullName,
      required this.userData,
      required this.size,
      required this.pickImage,
      required this.updateUserDate,
      required this.uploadImage,
      required this.bio,
      required this.nickName,
      required this.dateOfBirth,
      required this.gender});

  final TextEditingController fullName;
  final TextEditingController bio;
  final TextEditingController nickName;
  final TextEditingController dateOfBirth;
  final TextEditingController gender;
  final UserModel userData;
  final Size size;
  final PickImageCubit pickImage;
  final UpdateUserDataCubit updateUserDate;
  final UploadImageCubit uploadImage;

  @override
  Widget build(BuildContext context) {
    var storeImage = context.read<StoreImageCubit>();
    return BlocListener<UpdateUserDataCubit, UpdateUserDataStates>(
      listener: (context, updateUserData) {
        if (updateUserData is UpdateUserDataSuccess) {
          Navigator.pop(context);
          pickImage.selectedImage = null;
        }
      },
      child: BlocListener<PickImageCubit, PickImageStates>(
          listener: (context, state) {
            if (state is PickImageSucccess) {
              pickImage.selectedImage = state.image;
            }
          },
          child: CustomSaveChangesButton(
              pickImage: pickImage,
              fullName: fullName,
              userData: userData,
              bio: bio,
              gender: gender,
              dateOfBirth: dateOfBirth,
              nickName: nickName,
              uploadImage: uploadImage,
              storeImage: storeImage,
              updateUserDate: updateUserDate,
              size: size)),
    );
  }
}
