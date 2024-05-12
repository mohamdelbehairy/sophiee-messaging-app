import 'package:flutter/material.dart';
import 'package:sophiee/widgets/edit_profile_page_body/edit_body_component.dart';

import '../../cubit/pick_image/pick_image_cubit.dart';
import '../../cubit/upload/upload_image/upload_image_cubit.dart';
import '../../cubit/user_date/store_user_date/store_user_date_cubit.dart';

class EditProfileComponentDetails extends StatefulWidget {
  const EditProfileComponentDetails(
      {super.key,
      required this.size,
      required this.pickImage,
      required this.storeUserDate,
      required this.uploadImage});

  final Size size;
  final PickImageCubit pickImage;
  final StoreUserDateCubit storeUserDate;
  final UploadImageCubit uploadImage;

  @override
  State<EditProfileComponentDetails> createState() => _EditProfileComponentDetailsState();
}

class _EditProfileComponentDetailsState extends State<EditProfileComponentDetails> {
  TextEditingController fullName = TextEditingController();
  TextEditingController nickName = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController gender = TextEditingController();

  @override
  void dispose() {
    fullName.dispose();
    nickName.dispose();
    bio.dispose();
    dateOfBirth.dispose();
    gender.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EditBodyComponent(
        uploadImage: widget.uploadImage,
        storeUserDate: widget.storeUserDate,
        pickImage: widget.pickImage,
        fullName: fullName,
        nickName: nickName,
        bio: bio,
        dateOfBirth: dateOfBirth,
        gender: gender,
        size: widget.size);
  }
}
