import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/profile_image/choose_profile_image.dart';
import 'package:sophiee/utils/widget/profile_image/custom_profile_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage(
      {super.key,
      required this.user,
      required this.takePhoto,
      required this.choosePhoto});
  final UserModel user;
  final Function() takePhoto;
  final Function() choosePhoto;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return Stack(
      children: [
        BlocBuilder<PickImageCubit, PickImageStates>(
          builder: (context, state) {
            if (state is PickImageSucccess) {
              return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
                builder: (context, state) {
                  if (state is GetUserDataSuccess &&
                      state.userModel.isNotEmpty) {
                    final currentUser = FirebaseAuth.instance.currentUser;
                    if (currentUser != null) {
                      final userData = state.userModel.firstWhere(
                          (element) => element.userID == currentUser.uid);
                      return CustomProfileImage(
                          size: size,
                          isDark: isDark,
                          imageUrl: userData.profileImage);
                    } else {
                      return Container();
                    }
                  } else {
                    return Container();
                  }
                },
              );
            } else {
              return CustomProfileImage(
                  size: size, isDark: isDark, imageUrl: user.profileImage);
            }
          },
        ),
        ChooseProfileImage(
            isDark: isDark,
            isLoading: true,
            takePhoto: takePhoto,
            choosePhoto: choosePhoto,
            size: size)
      ],
    );
  }
}
