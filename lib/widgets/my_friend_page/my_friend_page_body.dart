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
import 'my_friends_bottom_send_message.dart';

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
        MyFriendItemTwo(user: user, widget: MyFriendsBottomMessage(user: user)),
        const SizedBox(height: 12),
        if (user.isBioAndNickName)
          MyFriendItems(
              text: 'About ${user.userName.split(' ')[0]}',
              textButton: 'More',
              onTap: () {}),
        if (user.isBioAndNickName) const SizedBox(height: 8),
        if (user.isBioAndNickName) MyFriendItemBio(user: user),
        if (user.isBioAndNickName) const SizedBox(height: 22),
        MyFriendItems(text: 'Friends', textButton: 'See all', onTap: () {}),
        const SizedBox(height: 4),
        MyFriendListViewFriends(friend: user),
        const SizedBox(height: 18),
        MyFriendItems(
            text: 'Photos',
            textButton: 'See all',
            onTap: () => getnav.Get.to(
                () => CardThreeSeeAllPage(
                    isDark: isDark, getImage: getImage, size: size),
                transition: getnav.Transition.downToUp)),
        const SizedBox(height: 4),
        MyFriendListViewImages(size: size, user: user)
      ],
    );
  }
}
