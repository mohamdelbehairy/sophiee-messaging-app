import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/copy_text/copy_text_cubit.dart';
import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/utils/widget/flutter_toast_widget.dart';

import '../../cubit/user_date/image/get_image/get_image_cubit.dart';
import '../../models/users_model.dart';
import '../../pages/card_three_see_all_page.dart';
import 'info_calls_widget.dart';
import 'my_friend_item_bio.dart';
import 'my_friend_item_one.dart';
import 'my_friend_item_two.dart';
import 'my_friend_items.dart';
import 'my_friend_list_view_friends.dart';
import 'my_friend_list_view_images.dart';
import 'profile_page_lock_widet.dart';

class MyFriendPageBody extends StatelessWidget {
  const MyFriendPageBody(
      {super.key,
      required this.user,
      required this.size,
      required this.userData});

  final UserModel user, userData;
  final Size size;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    var getImage = context.read<GetImageCubit>();
    return BlocListener<CopyTextCubit, CopyTextState>(
      listener: (context, state) {
        if (state is CopyTextSuccess) {
          FlutterToastWidget.showToast(msg: "Copied");
        }
      },
      child: Column(
        children: [
          MyFriendItemOne(user: user, userData: userData),
          MyFriendItemTwo(
              user: user,
              userData: userData,
              infoCalls: InfoCallsWidget(user: user)),
          if (!user.isProfileLock) const SizedBox(height: 12),
          if (user.isProfileLock ||
              userData.blockUsers.contains(user.userID) ||
              user.blockUsers.contains(userData.userID))
            ProfilePageLockWidget(
                userData: userData,
                size: size,
                user: user,
                isDark: isDark,
                isFriend: true),
          if (user.isBioAndNickName &&
              !user.isProfileLock &&
              !userData.blockUsers.contains(user.userID) &&
              !user.blockUsers.contains(userData.userID))
            MyFriendItems(
                text: 'About ${user.userName.split(' ')[0]}',
                textButton: 'More',
                onTap: () {}),
          if (user.isBioAndNickName &&
              !user.isProfileLock &&
              !userData.blockUsers.contains(user.userID) &&
              !user.blockUsers.contains(userData.userID))
            const SizedBox(height: 8),
          if (user.isBioAndNickName &&
              !user.isProfileLock &&
              !userData.blockUsers.contains(user.userID) &&
              !user.blockUsers.contains(userData.userID))
            MyFriendItemBio(user: user),
          if (user.isBioAndNickName &&
              !user.isProfileLock &&
              !userData.blockUsers.contains(user.userID) &&
              !user.blockUsers.contains(userData.userID))
            const SizedBox(height: 22),
          if (!user.isProfileLock &&
              !userData.blockUsers.contains(user.userID) &&
              !user.blockUsers.contains(userData.userID))
            MyFriendItems(text: 'Friends', textButton: 'See all', onTap: () {}),
          if (!user.isProfileLock &&
              !userData.blockUsers.contains(user.userID) &&
              !user.blockUsers.contains(userData.userID))
            const SizedBox(height: 4),
          if (!user.isProfileLock &&
              !userData.blockUsers.contains(user.userID) &&
              !user.blockUsers.contains(userData.userID))
            MyFriendListViewFriends(friend: user),
          if (!user.isProfileLock &&
              !userData.blockUsers.contains(user.userID) &&
              !user.blockUsers.contains(userData.userID))
            const SizedBox(height: 18),
          if (!user.isProfileLock &&
              !userData.blockUsers.contains(user.userID) &&
              !user.blockUsers.contains(userData.userID))
            MyFriendItems(
                text: 'Photos',
                textButton: 'See all',
                onTap: () => Navigation.push(
                    context,
                    CardThreeSeeAllPage(
                        isDark: isDark, getImage: getImage, size: size))),
          if (!user.isProfileLock &&
              !userData.blockUsers.contains(user.userID) &&
              !user.blockUsers.contains(userData.userID))
            const SizedBox(height: 4),
          if (!user.isProfileLock &&
              !userData.blockUsers.contains(user.userID) &&
              !user.blockUsers.contains(userData.userID))
            MyFriendListViewImages(size: size, user: user)
        ],
      ),
    );
  }
}
