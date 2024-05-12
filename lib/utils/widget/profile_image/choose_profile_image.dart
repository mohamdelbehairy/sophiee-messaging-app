import 'package:flutter/material.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/utils/widget/profile_image/edit_profile_image_bottom_sheet.dart';

class ChooseProfileImage extends StatelessWidget {
  const ChooseProfileImage(
      {super.key,
      required this.isDark,
      required this.takePhoto,
      required this.choosePhoto,
      required this.size,
      required this.isLoading});

  final bool isDark;
  final Function() takePhoto;
  final Function() choosePhoto;
  final Size size;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0.0,
        right: 0.0,
        child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              if (isLoading) {
                showModalBottomSheet(
                    backgroundColor:
                        isDark ? const Color(0xff2b2c33) : Colors.white,
                    context: context,
                    builder: (context) => EditProfileImageBottomSheet(
                        takePhoto: takePhoto, choosePhoto: choosePhoto));
              }
            },
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: size.width * .045,
                child: CircleAvatar(
                    radius: size.width * .04,
                    backgroundColor: kPrimaryColor,
                    child: const Icon(Icons.camera_alt_rounded,
                        color: Colors.white)))));
  }
}
