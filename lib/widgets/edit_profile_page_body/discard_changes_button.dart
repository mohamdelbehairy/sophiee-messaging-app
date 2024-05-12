import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../cubit/pick_image/pick_image_cubit.dart';
import '../../cubit/pick_image/pick_image_state.dart';
import '../../models/users_model.dart';
import '../../utils/widget/custom_bottom.dart';

class DiscardChangesButton extends StatelessWidget {
  const DiscardChangesButton(
      {super.key,
      required this.fullName,
      required this.userData,
      required this.nickName,
      required this.bio,
      required this.dateOfBirth,
      required this.gender,
      required this.pickImage,
      required this.size});

  final TextEditingController fullName;
  final UserModel userData;
  final TextEditingController nickName;
  final TextEditingController bio;
  final TextEditingController dateOfBirth;
  final TextEditingController gender;
  final PickImageCubit pickImage;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomBottom(
        text: 'Discard',
        colorBottom: Colors.white,
        colorText: kPrimaryColor,
        onPressed: () {
          fullName.text = userData.userName;
          nickName.text = userData.nickName;
          bio.text = userData.bio;
          dateOfBirth.text = userData.dateOfBirth;
          gender.text = userData.gender;
          if (pickImage.state is PickImageSucccess) {
            pickImage.emit(PickImageInitial());
            pickImage.selectedImage = null;
          }
        },
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: kPrimaryColor),
        width: size.width);
  }
}
