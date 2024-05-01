import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/upload/upload_image/upload_image_cubit.dart';
import 'package:sophiee/cubit/user_date/store_user_date/store_user_date_cubit.dart';
import 'package:sophiee/widgets/create_accont_widget/add_user_date_body_component.dart';
import 'package:flutter/material.dart';

class CustomAddUserDataPageBody extends StatefulWidget {
  const CustomAddUserDataPageBody(
      {super.key,
      required this.size,
      required this.pickImage,
      required this.storeUserDate,
      required this.uploadImage,
      required this.isLoading
      });
  final Size size;
  final PickImageCubit pickImage;
  final StoreUserDateCubit storeUserDate;
  final UploadImageCubit uploadImage;
  final bool isLoading;


  @override
  State<CustomAddUserDataPageBody> createState() =>
      _CustomAddUserDataPageBodyState();
}

class _CustomAddUserDataPageBodyState extends State<CustomAddUserDataPageBody> {
  TextEditingController fullName = TextEditingController();
  TextEditingController nickName = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController gender = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  @override
  void dispose() {
    fullName.dispose();
    nickName.dispose();
    dateOfBirth.dispose();
    email.dispose();
    phoneNumber.dispose();
    gender.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.size.width * .04),
      child: AddUserDataPageBodyComponent(
         
          isLoading: widget.isLoading,
          globalKey: globalKey,
          widget: widget,
          fullName: fullName,
          nickName: nickName,
          bio: bio,
          dateOfBirth: dateOfBirth,
          email: email,
          phoneNumber: phoneNumber,
          gender: gender),
    );
  }
}
