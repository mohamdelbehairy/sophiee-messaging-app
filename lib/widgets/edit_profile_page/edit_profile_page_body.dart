import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/widgets/edit_profile_page/edit_profile_field.dart';
import 'package:sophiee/widgets/edit_profile_page/edit_profile_image.dart';
import 'package:sophiee/widgets/edit_profile_page/edit_profile_name.dart';
import 'package:sophiee/widgets/edit_profile_page/edit_profile_nick_name.dart';
import 'package:sophiee/widgets/edit_profile_page/edit_profile_bio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

class EditProfilePageBody extends StatelessWidget {
  const EditProfilePageBody({
    super.key,
    required this.takePhoto,
    required this.choosePhoto,
  });
  final Function() takePhoto;
  final Function() choosePhoto;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          left: size.width * .025,
          right: size.width * .025,
          top: size.width * .025,
          bottom: size.width * .025),
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              blurRadius: 40,
              color: context.read<LoginCubit>().isDark
                  ? Colors.grey.withOpacity(.1)
                  : Colors.grey.withOpacity(.4),
            ),
          ],
        ),
        child: Card(
          color: context.read<LoginCubit>().isDark
              ? const Color(0xff2b2c33)
              : Colors.white,
          elevation: 0,
          child: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
            builder: (context, state) {
              if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
                final currentUser = FirebaseAuth.instance.currentUser;
                if (currentUser != null) {
                  final userData = state.userModel.firstWhere(
                      (element) => element.userID == currentUser.uid);
                  return Column(
                    children: [
                      SizedBox(height: size.height * .05),
                      EditProfileImage(
                          user: userData,
                          takePhoto: takePhoto,
                          choosePhoto: choosePhoto),
                      SizedBox(height: size.height * .01),
                      EditProfileField(
                          fieldName: 'Name',
                          fieldValue: userData.userName,
                          onTap: () => getnav.Get.to(
                              () => EditProfileName(user: userData),
                              transition: getnav.Transition.leftToRight)),
                      EditProfileField(
                          fieldName: 'Email address',
                          fieldValue: userData.emailAddress,
                          onTap: () {}),
                      EditProfileField(
                        fieldName: 'Nick name',
                        fieldValue: userData.nickName,
                        onTap: () => getnav.Get.to(
                            () => EditProfileNickName(user: userData),
                            transition: getnav.Transition.leftToRight),
                      ),
                      EditProfileField(
                        fieldName: 'Bio',
                        fieldValue: userData.bio,
                        onTap: () => getnav.Get.to(
                            () => EditProfileBio(user: userData),
                            transition: getnav.Transition.leftToRight),
                      ),
                      EditProfileField(
                        fieldName: 'Twitter',
                        fieldValue: '',
                        onTap: () {},
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
