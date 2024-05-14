import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../cubit/pick_image/pick_image_cubit.dart';
import '../../cubit/update_user_data/update_user_cubit_cubit.dart';
import '../../cubit/upload/upload_image/upload_image_cubit.dart';
import '../../cubit/user_date/image/store_image/store_image_cubit.dart';
import '../../models/users_model.dart';
import '../../utils/widget/custom_bottom.dart';

class CustomSaveChangesButton extends StatelessWidget {
  const CustomSaveChangesButton(
      {super.key,
      required this.pickImage,
      required this.fullName,
      required this.userData,
      required this.bio,
      required this.gender,
      required this.dateOfBirth,
      required this.nickName,
      required this.uploadImage,
      required this.storeImage,
      required this.updateUserDate,
      required this.size});

  final PickImageCubit pickImage;
  final TextEditingController fullName;
  final UserModel userData;
  final TextEditingController bio;
  final TextEditingController gender;
  final TextEditingController dateOfBirth;
  final TextEditingController nickName;
  final UploadImageCubit uploadImage;
  final StoreImageCubit storeImage;
  final UpdateUserDataCubit updateUserDate;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomBottom(
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
              storeImage.storeImage(
                  imageUrl: profileImage,
                  isProfileImage: true,
                  isStoryImage: false);
            }
            await updateUserDate.updateUserData(
                profileImage: profileImage ?? userData.profileImage,
                userName: fullName.text,
                bio: bio.text,
                nickName: nickName.text,
                dateOfBirth: dateOfBirth.text,
                gender: gender.text);
          }
        },
        borderRadius: BorderRadius.circular(24),
        width: size.width);
  }
}
