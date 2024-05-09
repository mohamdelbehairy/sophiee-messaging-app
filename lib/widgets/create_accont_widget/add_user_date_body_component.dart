import 'package:sophiee/widgets/create_accont_widget/add_user_bottom.dart';
import 'package:sophiee/widgets/create_accont_widget/add_user_date_of_birth.dart';
import 'package:sophiee/widgets/create_accont_widget/add_user_phone_number.dart';
import 'package:sophiee/widgets/create_accont_widget/custom_add_user_date_page_body.dart';
import 'package:sophiee/widgets/create_accont_widget/add_user_email.dart';
import 'package:sophiee/widgets/create_accont_widget/add_user_full_name.dart';
import 'package:sophiee/widgets/create_accont_widget/add_user_gender.dart';
import 'package:sophiee/widgets/create_accont_widget/add_user_profile_image.dart';
import 'package:sophiee/widgets/create_accont_widget/add_user_text_filed.dart';
import 'package:flutter/material.dart';

class AddUserDataPageBodyComponent extends StatefulWidget {
  const AddUserDataPageBodyComponent(
      {super.key,
      required this.globalKey,
      required this.widget,
      required this.fullName,
      required this.nickName,
      required this.bio,
      required this.dateOfBirth,
      required this.email,
      required this.phoneNumber,
      required this.gender,
      required this.isLoading});

  final GlobalKey<FormState> globalKey;
  final CustomAddUserDataPageBody widget;
  final TextEditingController fullName;
  final TextEditingController nickName;
  final TextEditingController bio;
  final TextEditingController dateOfBirth;
  final TextEditingController email;
  final TextEditingController phoneNumber;
  final TextEditingController gender;
  final bool isLoading;

  @override
  State<AddUserDataPageBodyComponent> createState() =>
      _AddUserDataPageBodyComponentState();
}

class _AddUserDataPageBodyComponentState
    extends State<AddUserDataPageBodyComponent> {
  String? phone;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: widget.globalKey,
        child: Column(
          children: [
            AddUserProfileImage(
                enabled: !widget.isLoading,
                size: widget.widget.size,
                pickImage: widget.widget.pickImage),
            AddUserFullName(
                enabled: !widget.isLoading,
                size: widget.widget.size,
                fullName: widget.fullName),
            AddUserTextField(
                enabled: !widget.isLoading,
                size: widget.widget.size,
                hintText: 'Nick Name',
                controller: widget.nickName),
            AddUserTextField(
                enabled: !widget.isLoading,
                size: widget.widget.size,
                hintText: 'Bio',
                controller: widget.bio),
            AddUserDateOfBirth(
                enabled: !widget.isLoading,
                size: widget.widget.size,
                dateOfBirth: widget.dateOfBirth),
            AddUserEmail(
                enabled: !widget.isLoading,
                size: widget.widget.size,
                email: widget.email),
            AddUserPhoneNumber(
              enabled: !widget.isLoading,
              size: widget.widget.size,
              phoneNumber: widget.phoneNumber,
              onChanged: (value) {
                // print(value.countryCode);
                // print(value.number);
                debugPrint(widget.phoneNumber.text);
                setState(() {
                  phone = '${value.countryCode} ${value.number}';
                });
              },
            ),
            AddUserGender(
                enabled: widget.isLoading,
                size: widget.widget.size,
                gender: widget.gender),
            AddUserBottom(
                isLoading: widget.isLoading,
                phoneNumber: phone,
                pickImage: widget.widget.pickImage,
                storeUserDate: widget.widget.storeUserDate,
                uploadImage: widget.widget.uploadImage,
                globalKey: widget.globalKey,
                size: widget.widget.size,
                email: widget.email,
                fullName: widget.fullName,
                dateOfBirth: widget.dateOfBirth,
                nickName: widget.nickName,
                gender: widget.gender,
                bio: widget.bio,
                phoneController: widget.phoneNumber)
          ],
        ),
      ),
    );
  }
}
