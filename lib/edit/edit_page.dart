import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/utils/widget/custom_bottom.dart';

import '../cubit/pick_image/pick_image_cubit.dart';
import '../cubit/upload/upload_image/upload_image_cubit.dart';
import '../cubit/user_date/store_user_date/store_user_date_cubit.dart';
import '../widgets/create_accont_widget/add_user_date_of_birth.dart';
import '../widgets/create_accont_widget/add_user_full_name.dart';
import '../widgets/create_accont_widget/add_user_gender.dart';
import '../widgets/create_accont_widget/add_user_phone_number.dart';
import '../widgets/create_accont_widget/add_user_profile_image.dart';
import '../widgets/create_accont_widget/add_user_text_filed.dart';
import '../widgets/settings/seetings_page_app_bar.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.size});
  final Size size;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController fullName = TextEditingController();
  TextEditingController nickName = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController gender = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var pickImage = context.read<PickImageCubit>();
    var storeUserData = context.read<StoreUserDateCubit>();
    var uploadImage = context.read<UploadImageCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingsPageAppBar(size: widget.size),
            EditBody(
              size: widget.size,
              pickImage: pickImage,
            ),
          ],
        ),
      ),
    );
  }
}

class EditBody extends StatelessWidget {
  const EditBody({super.key, required this.size, required this.pickImage});

  final Size size;
  final PickImageCubit pickImage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = FirebaseAuth.instance.currentUser;
          if (currentUser != null) {
            final userData = state.userModel
                .firstWhere((element) => element.userID == currentUser.uid);
            TextEditingController fullName =
                TextEditingController(text: userData.userName);
            TextEditingController nickName =
                TextEditingController(text: userData.nickName);
            TextEditingController bio =
                TextEditingController(text: userData.bio);
            TextEditingController dateOfBirth =
                TextEditingController(text: userData.dateOfBirth);

            TextEditingController phoneNumber =
                TextEditingController(text: userData.phoneNumber);
            TextEditingController gender =
                TextEditingController(text: userData.gender);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .04),
              child: Column(
                children: [
                  AddUserProfileImage(
                      imageUrl: userData.profileImage,
                      top: size.height * .02,
                      // enabled: !widget.isLoading,
                      enabled: true,
                      size: size,
                      pickImage: pickImage),
                  AddUserFullName(
                      // enabled: !widget.isLoading,
                      enabled: true,
                      size: size,
                      fullName: fullName),
                  AddUserTextField(
                      // enabled: !widget.isLoading,
                      enabled: true,
                      size: size,
                      hintText: 'Nick Name',
                      controller: nickName),
                  AddUserTextField(
                      // enabled: !widget.isLoading,

                      enabled: true,
                      size: size,
                      hintText: 'Bio',
                      controller: bio),
                  AddUserDateOfBirth(
                      // enabled: !widget.isLoading,
                      enabled: true,
                      size: size,
                      dateOfBirth: dateOfBirth),
                  // AddUserEmail(
                  //     // enabled: !widget.isLoading,
                  //     enabled: true,
                  //     size: size,
                  //     email: email),
                  // AddUserPhoneNumber(
                  //   // enabled: !widget.isLoading,
                  //   enabled: true,
                  //   size: widget.size,
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
                  CustomBottom(
                      text: 'Save Changes',
                      colorBottom: kPrimaryColor,
                      colorText: Colors.white,
                      onPressed: () {
                        if (fullName.text != userData.userName) {
                          // print('full name: ${fullName.text}');
                          // print('userName": ${userData.userName}');
                        }
                      },
                      borderRadius: BorderRadius.circular(24),
                      width: size.width),
                  const SizedBox(height: 8),
                  CustomBottom(
                      text: 'Discard',
                      colorBottom: Colors.white,
                      colorText: kPrimaryColor,
                      onPressed: () {
                        fullName.text = userData.userName;
                        nickName.text = userData.nickName;
                        bio.text = userData.bio;
                        dateOfBirth.text = userData.dateOfBirth;

                        phoneNumber.text = userData.phoneNumber ?? "";
                        gender.text = userData.gender;
                      },
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: kPrimaryColor),
                      width: size.width),
                ],
              ),
            );
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
