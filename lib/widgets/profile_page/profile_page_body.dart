import 'package:shared_preferences/shared_preferences.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/utils/shimmer/home/profile/profile_page_shimmer.dart';
import 'package:sophiee/widgets/profile_page/profile_page_body_component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserDataCubit, GetUserDataStates>(
      listener: (context, state) async {
        final pref = await SharedPreferences.getInstance();
        pref.setString('storeUser', FirebaseAuth.instance.currentUser!.uid);
      },
      builder: (context, state) {
        if (state is GetUserDataLoading) {
          return const ProfilePageShimmer();
        } else if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = FirebaseAuth.instance.currentUser;
          if (currentUser != null) {
            final userData = state.userModel
                .firstWhere((element) => element.userID == currentUser.uid);

            // UserCallInit.onUserLogin(
            //     userID: userData.userID, userName: userData.userName);
            return ProfilePageBodyComponent(size: size, user: userData);
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
