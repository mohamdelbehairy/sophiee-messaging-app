import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/connectivity/connectivity_cubit.dart';
import 'package:sophiee/cubit/get_followers/get_followers_cubit.dart';
import 'package:sophiee/cubit/get_following/get_following_cubit.dart';
import 'package:sophiee/cubit/user_date/image/get_image/get_image_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/my_friend_page.dart';
import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/utils/shimmer/home/all_chats/chat_page/chat_page_friend_info_shimmer.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_friend_info_bottom_sheet/chat_page_friend_info_bottom_sheet_body.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';

class ChatPageFriendBottomSheetInfo extends StatefulWidget {
  const ChatPageFriendBottomSheetInfo(
      {super.key, required this.user, required this.userData});
  final UserModel user, userData;

  @override
  State<ChatPageFriendBottomSheetInfo> createState() =>
      _ChatPageFriendBottomSheetInfoState();
}

class _ChatPageFriendBottomSheetInfoState
    extends State<ChatPageFriendBottomSheetInfo> {
  @override
  void initState() {
    super.initState();
    context.read<GetFollowersCubit>().getFollowers(userID: widget.user.userID);
    context.read<GetFollowingCubit>().getFollowing(userID: widget.user.userID);
    context.read<GetImageCubit>().getImage(userID: widget.user.userID);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;

    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (!widget.userData.blockUsers.contains(widget.user.userID) &&
            !widget.user.blockUsers.contains(widget.userData.userID)) {
          Navigation.push(context, MyFriendPage(user: widget.user));
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: isDark ? cardDarkModeBackground : cardLightModeBackground,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size.width * .04),
                topRight: Radius.circular(size.width * .04))),
        child: BlocBuilder<ConnectivityCubit, ConnectivityResult>(
          builder: (context, state) {
            if (state == ConnectivityResult.wifi ||
                state == ConnectivityResult.mobile ||
                state == ConnectivityResult.vpn) {
              return ChatPageFriendInfoBottomSheetBody(
                  userData: widget.userData,
                  isDark: isDark,
                  size: size,
                  user: widget.user);
            } else {
              return ChatPageFriendInfoShimmer(size: size);
            }
          },
        ),
      ),
    );
  }
}
