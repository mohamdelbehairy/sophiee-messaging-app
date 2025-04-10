import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants.dart';
import '../../../cubit/get_followers/get_followers_cubit.dart';
import '../../../cubit/get_following/get_following_cubit.dart';
import '../../../cubit/user_date/image/get_image/get_image_cubit.dart';
// import '../../../models/send_call_invitation_model.dart';
import '../../../models/users_model.dart';
import '../../../utils/methods/initial_state.dart';
// import '../../../utils/widget/send_call_invitation_button.dart';
import 'chat_page_app_bar_title.dart';
import 'chats_icons_app_bar_button.dart';

AppBar chatPageAppBar(
    {required BuildContext context,
    required UserModel user,
    required UserModel userData}) {
  return AppBar(
    titleSpacing: -8.0,
    backgroundColor: kPrimaryColor,
    elevation: 0,
    title: ChatPageAppBarTitle(user: user, userData: userData),
    iconTheme: const IconThemeData(size: 35, color: Colors.white),
    leading: GestureDetector(
        onTap: () {
          InitialState.initPickContactState(context);
          Navigator.pop(context);
          context
              .read<GetFollowersCubit>()
              .getFollowers(userID: FirebaseAuth.instance.currentUser!.uid);
          context
              .read<GetFollowingCubit>()
              .getFollowing(userID: FirebaseAuth.instance.currentUser!.uid);
          context
              .read<GetImageCubit>()
              .getImage(userID: FirebaseAuth.instance.currentUser!.uid);
        },
        child: const Icon(Icons.arrow_back)),
    actions: const [
      // if (user.isAudioAndVideoCall &&
      //     !userData.blockUsers.contains(user.userID) &&
      //     !user.blockUsers.contains(userData.userID))
      //   SendCallInvitationButton(
      //       sendCallInvitationModel: SendCallInvitationModel(
      //           userID: user.userID,
      //           userName: user.userName,
      //           icon: Icons.call,
      //           isVideoCall: false,
      //           paddingLeft: 45)),
      // if (user.isAudioAndVideoCall &&
      //     !userData.blockUsers.contains(user.userID) &&
      //     !user.blockUsers.contains(userData.userID))
      //   SendCallInvitationButton(
      //       sendCallInvitationModel: SendCallInvitationModel(
      //           userID: user.userID,
      //           userName: user.userName,
      //           icon: FontAwesomeIcons.video)),
      ChatsIconsAppBarButton(icon: Icons.error),
    ],
  );
}
