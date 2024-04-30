import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/pages/edit_profile_page.dart';
import 'package:sophiee/utils/shimmer/home/profile/profile_page_shimmer.dart';
import 'package:sophiee/widgets/profile_page/custom_profile_page_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataLoading) {
          return const ProfilePageShimmer();
        } else if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = FirebaseAuth.instance.currentUser;
          if (currentUser != null) {
            final userData = state.userModel
                .firstWhere((element) => element.userID == currentUser.uid);
            TextEditingController controller =
                TextEditingController(text: userData.bio);
           
            return CustomProfilePageBody(
              user: userData,
              onTap: () {
                getnav.Get.to(
                    () =>
                        EditProfilePage(user: userData, controller: controller),
                    transition: getnav.Transition.leftToRight);
              },
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
