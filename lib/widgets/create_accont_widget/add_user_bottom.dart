import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';
import 'package:sophiee/cubit/upload/upload_image/upload_image_cubit.dart';
import 'package:sophiee/cubit/user_date/store_user_date/store_user_date_cubit.dart';
import 'package:sophiee/pages/create_account/verificaton_page.dart';
import 'package:sophiee/pages/home_page.dart';
import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/utils/widget/custom_bottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddUserBottom extends StatelessWidget {
  const AddUserBottom(
      {super.key,
      required this.globalKey,
      required this.size,
      required this.email,
      required this.fullName,
      required this.dateOfBirth,
      required this.nickName,
      required this.storeUserDate,
      required this.gender,
      required this.bio,
      required this.uploadImage,
      required this.pickImage,
      required this.phoneNumber,
      required this.phoneController,
      required this.isLoading});

  final GlobalKey<FormState> globalKey;
  final Size size;
  final TextEditingController email;
  final TextEditingController fullName;
  final TextEditingController dateOfBirth;
  final TextEditingController nickName;
  final TextEditingController gender;
  final TextEditingController bio;
  final TextEditingController phoneController;
  final StoreUserDateCubit storeUserDate;
  final UploadImageCubit uploadImage;
  final PickImageCubit pickImage;
  final String? phoneNumber;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PickImageCubit, PickImageStates>(
      listener: (context, state) {
        if (state is PickImageSucccess) {
          pickImage.selectedImage = state.image;
        }
      },
      child: CustomBottom(
          text: 'Continue',
          isLoading: isLoading,
          colorBottom: kPrimaryColor,
          colorText: Colors.white,
          onPressed: () async {
            await onPressedCustomBottom(context);
          },
          borderRadius: BorderRadius.circular(size.width * .08),
          width: size.width),
    );
  }

  Future<void> onPressedCustomBottom(BuildContext context) async {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();

      String profileImage;
      if (pickImage.selectedImage != null) {
        profileImage = await uploadImage.uploadImage(
            imageFile: pickImage.selectedImage!, fieldName: 'user_images');
      } else {
        profileImage = defaultProfileImageUrl;
      }

      if (FirebaseAuth.instance.currentUser!.email != null) {
        await storeUserDate.storeUserData(
            emailAddress: email.text.isNotEmpty
                ? email.text
                : FirebaseAuth.instance.currentUser!.email!,
            userName: fullName.text,
            dateOfBirth: dateOfBirth.text,
            nickName: nickName.text,
            bio: bio.text,
            gender: gender.text,
            isEmailAuth: true,
            phoneNumber: phoneController.text.isNotEmpty ? phoneNumber! : null,
            profileImage: profileImage);

        // ignore: use_build_context_synchronously
        Navigation.push(context, const VerificationPage());
      }
      if (FirebaseAuth.instance.currentUser!.phoneNumber != null) {
        await storeUserDate.storeUserData(
            emailAddress: email.text,
            userName: fullName.text,
            dateOfBirth: dateOfBirth.text,
            nickName: nickName.text,
            bio: bio.text,
            gender: gender.text,
            phoneNumber: phoneController.text.isNotEmpty
                ? phoneNumber
                : FirebaseAuth.instance.currentUser!.phoneNumber,
            profileImage: profileImage);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userID', FirebaseAuth.instance.currentUser!.uid);
        // ignore: use_build_context_synchronously
        Navigation.go(context, const HomePage());
      }
    }
  }

  Future<void> newMethod(BuildContext context) async {
    {
      if (globalKey.currentState!.validate()) {
        globalKey.currentState!.save();

        String profileImage;
        if (pickImage.selectedImage != null) {
          profileImage = await uploadImage.uploadImage(
              imageFile: pickImage.selectedImage!, fieldName: 'user_images');
        } else {
          profileImage = defaultProfileImageUrl;
        }

        if (FirebaseAuth.instance.currentUser!.email != null) {
          await storeUserDate.storeUserData(
              emailAddress: email.text.isNotEmpty
                  ? email.text
                  : FirebaseAuth.instance.currentUser!.email!,
              userName: fullName.text,
              dateOfBirth: dateOfBirth.text,
              nickName: nickName.text,
              bio: bio.text,
              gender: gender.text,
              isEmailAuth: true,
              phoneNumber:
                  phoneController.text.isNotEmpty ? phoneNumber! : null,
              profileImage: profileImage);

          // ignore: use_build_context_synchronously
          Navigation.push(context, const VerificationPage());
        }
        if (FirebaseAuth.instance.currentUser!.phoneNumber != null) {
          await storeUserDate.storeUserData(
              emailAddress: email.text,
              userName: fullName.text,
              dateOfBirth: dateOfBirth.text,
              nickName: nickName.text,
              bio: bio.text,
              gender: gender.text,
              phoneNumber: phoneController.text.isNotEmpty
                  ? phoneNumber
                  : FirebaseAuth.instance.currentUser!.phoneNumber,
              profileImage: profileImage);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('userID', FirebaseAuth.instance.currentUser!.uid);
          // ignore: use_build_context_synchronously
          Navigation.go(context, const HomePage());
        }
      }
    }
  }
}
