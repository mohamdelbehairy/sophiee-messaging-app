import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';

import '../../cubit/upload/upload_image/upload_image_cubit.dart';
import '../../cubit/user_date/get_user_data/get_user_data_cubit.dart';
import '../../cubit/user_date/get_user_data/get_user_data_state.dart';
import '../../cubit/user_date/store_user_date/store_user_date_cubit.dart';
import 'edit_profile_page_fields.dart';

class EditBodyComponent extends StatelessWidget {
  const EditBodyComponent(
      {super.key,
      required this.fullName,
      required this.nickName,
      required this.bio,
      required this.dateOfBirth,
      required this.gender,
      required this.size,
      required this.storeUserDate,
      required this.pickImage,
      required this.uploadImage});

  final TextEditingController fullName;
  final TextEditingController nickName;
  final TextEditingController bio;
  final TextEditingController dateOfBirth;
  final TextEditingController gender;
  final Size size;
  final StoreUserDateCubit storeUserDate;
  final PickImageCubit pickImage;
  final UploadImageCubit uploadImage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = FirebaseAuth.instance.currentUser;
          if (currentUser != null) {
            final userData = state.userModel
                .firstWhere((element) => element.userID == currentUser.uid);
            fullName.text = userData.userName;
            nickName.text = userData.nickName;
            bio.text = userData.bio;
            dateOfBirth.text = userData.dateOfBirth;
            gender.text = userData.gender;

            return EditProfilePageFields(
                size: size,
                userData: userData,
                pickImage: pickImage,
                fullName: fullName,
                nickName: nickName,
                bio: bio,
                dateOfBirth: dateOfBirth,
                gender: gender,
                uploadImage: uploadImage,
                storeUserDate: storeUserDate);
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }
}

