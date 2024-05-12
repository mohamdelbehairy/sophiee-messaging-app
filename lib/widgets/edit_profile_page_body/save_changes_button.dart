import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';

import '../../constants.dart';
import '../../cubit/upload/upload_image/upload_image_cubit.dart';
import '../../cubit/user_date/store_user_date/store_user_date_cubit.dart';
import '../../models/users_model.dart';
import '../../utils/widget/custom_bottom.dart';

class SaveChangesButton extends StatelessWidget {
  const SaveChangesButton(
      {super.key,
      required this.fullName,
      required this.userData,
      required this.size,
      required this.pickImage,
      required this.storeUserDate,
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
  final StoreUserDateCubit storeUserDate;
  final UploadImageCubit uploadImage;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PickImageCubit, PickImageStates>(
      listener: (context, state) {
        if (state is PickImageSucccess) {
          pickImage.selectedImage = state.image;
        }
      },
      child: CustomBottom(
          text: 'Save Changes',
          colorBottom: kPrimaryColor,
          colorText: Colors.white,
          onPressed: () async {
            if (pickImage.selectedImage != null ||
                fullName.text != userData.userName ||
                bio.text != userData.bio ||
                gender.text != userData.gender ||
                dateOfBirth.text != userData.dateOfBirth ||
                nickName.text != userData.nickName) {
              String? profileImage;
              if (pickImage.selectedImage != null) {
                profileImage = await uploadImage.uploadImage(
                    imageFile: pickImage.selectedImage!,
                    fieldName: 'user_images');
              }
              await storeUserDate.storeUserData(
                  emailAddress: '',
                  userName: fullName.text,
                  dateOfBirth: dateOfBirth.text,
                  nickName: nickName.text,
                  bio: bio.text,
                  gender: gender.text,
                  // isEmailAuth: true,
                  // phoneNumber:
                  //     phoneController.text.isNotEmpty ? phoneNumber! : null,
                  profileImage: profileImage ?? userData.profileImage);
            }
          },
          borderRadius: BorderRadius.circular(24),
          width: size.width),
    );
  }
}
