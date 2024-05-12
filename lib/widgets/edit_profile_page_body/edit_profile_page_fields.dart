import 'package:flutter/material.dart';

import '../../cubit/pick_image/pick_image_cubit.dart';
import '../../cubit/upload/upload_image/upload_image_cubit.dart';
import '../../cubit/user_date/store_user_date/store_user_date_cubit.dart';
import '../../models/users_model.dart';
import '../create_accont_widget/add_user_date_of_birth.dart';
import '../create_accont_widget/add_user_full_name.dart';
import '../create_accont_widget/add_user_gender.dart';
import '../create_accont_widget/add_user_profile_image.dart';
import '../create_accont_widget/add_user_text_filed.dart';
import 'discard_changes_button.dart';
import 'save_changes_button.dart';

class EditProfilePageFields extends StatelessWidget {
  const EditProfilePageFields(
      {super.key,
      required this.size,
      required this.userData,
      required this.pickImage,
      required this.fullName,
      required this.nickName,
      required this.bio,
      required this.dateOfBirth,
      required this.gender,
      required this.uploadImage,
      required this.storeUserDate});

  final Size size;
  final UserModel userData;
  final PickImageCubit pickImage;
  final TextEditingController fullName;
  final TextEditingController nickName;
  final TextEditingController bio;
  final TextEditingController dateOfBirth;
  final TextEditingController gender;
  final UploadImageCubit uploadImage;
  final StoreUserDateCubit storeUserDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .04),
      child: Column(
        children: [
          AddUserProfileImage(
              imageUrl: userData.profileImage,
              top: size.height * .02,
              enabled: true,
              size: size,
              pickImage: pickImage),
          AddUserFullName(enabled: true, size: size, fullName: fullName),
          AddUserTextField(
              enabled: true,
              size: size,
              hintText: 'Nick Name',
              controller: nickName),
          AddUserTextField(
              enabled: true, size: size, hintText: 'Bio', controller: bio),
          AddUserDateOfBirth(
              enabled: true, size: size, dateOfBirth: dateOfBirth),
          // AddUserEmail(
          //
          //     enabled: true,
          //     size: size,
          //     email: email),
          // AddUserPhoneNumber(
          //
          //   enabled: true,
          //   size: size,
          //   phoneNumber: phoneNumber,
          //   onChanged: (value) {
          //     print(value.countryCode);
          //     print(value.number);
          //     debugPrint(widget.phoneNumber.text);
          //     setState(() {
          //       phone = '${value.countryCode} ${value.number}';
          //     });
          //   },
          // ),
          AddUserGender(
              // enabled: widget.isLoading,
              enabled: false,
              size: size,
              gender: gender),
          SaveChangesButton(
              uploadImage: uploadImage,
              storeUserDate: storeUserDate,
              pickImage: pickImage,
              fullName: fullName,
              nickName: nickName,
              bio: bio,
              dateOfBirth: dateOfBirth,
              gender: gender,
              userData: userData,
              size: size),
          const SizedBox(height: 8),
          DiscardChangesButton(
              fullName: fullName,
              userData: userData,
              nickName: nickName,
              bio: bio,
              dateOfBirth: dateOfBirth,
              gender: gender,
              pickImage: pickImage,
              size: size)
        ],
      ),
    );
  }
}

