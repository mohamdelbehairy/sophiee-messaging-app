import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/models/my_friend_icon_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/utils/initial_state.dart';

import 'my_friend_page_icon.dart';
import 'my_friend_page_icon_elispes.dart';
import '../../utils/widget/custom_user_image.dart';

class MyFriendItemOne extends StatelessWidget {
  const MyFriendItemOne({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CustomUserImage(user: user, size: size),
        MyFriendPageIconElispes(user: user, size: size,isFriend: true),
        MyFriendPageIcon(
            myFriendIconModel: MyFriendIconModel(
                left: 8,
                size: size.height * .035,
                icon: Icons.arrow_back,
                onPressed: () {
                  Navigator.pop(context);
                  InitialState.initFriendState(context);
                  context.read<GetFriendsCubit>().getFriends(
                      userID: FirebaseAuth.instance.currentUser!.uid);
                })),
      ],
    );
  }
}
