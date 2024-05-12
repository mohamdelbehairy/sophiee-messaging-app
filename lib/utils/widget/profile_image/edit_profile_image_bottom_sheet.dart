import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';

import 'bottom_sheet_items.dart';

class EditProfileImageBottomSheet extends StatelessWidget {
  const EditProfileImageBottomSheet(
      {super.key, required this.takePhoto, required this.choosePhoto});
  final Function() takePhoto;
  final Function() choosePhoto;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;

    navigatorPop() {
      Navigator.pop(context);
    }

    return SizedBox(
      height: size.height * .3,
      width: size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .05),
        child: Column(
          children: [
            SizedBox(
                width: size.width * .1, child: const Divider(thickness: 5)),
            SizedBox(height: size.height * .02),
            Text('Change profile picture',
                style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: size.width * .042)),
            SizedBox(height: size.height * .03),
            BottomSheetItems(
                text: 'Take photo',
                icon: Icons.camera_alt_rounded,
                onTap: takePhoto),
            SizedBox(height: size.height * .03),
            BottomSheetItems(
                text: 'Choose from gallery',
                icon: Icons.collections,
                onTap: choosePhoto),
            SizedBox(height: size.height * .03),
            BottomSheetItems(
                text: 'Use avatar',
                icon: Icons.face,
                onTap: () {
                  navigatorPop();
                }),
          ],
        ),
      ),
    );
  }
}
