import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;
import 'package:sophiee/cubit/auth/login/login_cubit.dart';

import '../../cubit/user_date/image/get_image/get_image_cubit.dart';
import '../../models/users_model.dart';
import '../../pages/card_three_see_all_page.dart';
import 'my_friend_item_bio.dart';
import 'my_friend_item_one.dart';
import 'my_friend_item_two.dart';
import 'my_friend_items.dart';
import 'my_friend_list_view_friends.dart';
import 'my_friend_list_view_images.dart';

class MyFriendPageBody extends StatelessWidget {
  const MyFriendPageBody({super.key, required this.user, required this.size});

  final UserModel user;
  final Size size;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    var getImage = context.read<GetImageCubit>();
    return Column(
      children: [
        MyFriendItemOne(user: user),
        MyFriendItemTwo(user: user),
        if (!user.isProfileLock) const SizedBox(height: 12),
        if (user.isProfileLock) SizedBox(height: size.height * .1),
        if (user.isProfileLock)
          Text('${user.userName} is locked your profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: isDark ? Colors.white : Colors.black, fontSize: 20)),
        if (user.isBioAndNickName && !user.isProfileLock)
          MyFriendItems(
              text: 'About ${user.userName.split(' ')[0]}',
              textButton: 'More',
              onTap: () {}),
        if (user.isBioAndNickName && !user.isProfileLock)
          const SizedBox(height: 8),
        if (user.isBioAndNickName && !user.isProfileLock)
          MyFriendItemBio(user: user),
        if (user.isBioAndNickName && !user.isProfileLock)
          const SizedBox(height: 22),
        if (!user.isProfileLock)
          MyFriendItems(text: 'Friends', textButton: 'See all', onTap: () {}),
        if (!user.isProfileLock) const SizedBox(height: 4),
        if (!user.isProfileLock) MyFriendListViewFriends(friend: user),
        if (!user.isProfileLock) const SizedBox(height: 18),
        if (!user.isProfileLock)
          MyFriendItems(
              text: 'Photos',
              textButton: 'See all',
              onTap: () => getnav.Get.to(
                  () => CardThreeSeeAllPage(
                      isDark: isDark, getImage: getImage, size: size),
                  transition: getnav.Transition.downToUp)),
        if (!user.isProfileLock) const SizedBox(height: 4),
        if (!user.isProfileLock) MyFriendListViewImages(size: size, user: user)
      ],
    );
  }
}
