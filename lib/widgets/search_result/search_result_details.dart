import 'package:flutter/material.dart';

import '../../cubit/user_date/image/get_image/get_image_cubit.dart';
import '../../models/users_model.dart';
import '../../pages/card_three_see_all_page.dart';
import '../my_friend_page/my_friend_item_bio.dart';
import '../my_friend_page/my_friend_items.dart';
import '../my_friend_page/my_friend_list_view_friends.dart';
import 'package:get/get.dart' as getnav;

import '../my_friend_page/my_friend_list_view_images.dart';

class SearchResultDetails extends StatelessWidget {
  const SearchResultDetails(
      {super.key,
      required this.user,
      required this.isDark,
      required this.getImage,
      required this.size});

  final UserModel user;
  final bool isDark;
  final GetImageCubit getImage;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        MyFriendItems(
            text: 'About ${user.userName.split(' ')[0]}',
            textButton: 'More',
            onTap: () {}),
        const SizedBox(height: 8),
        MyFriendItemBio(user: user),
        const SizedBox(height: 22),
        MyFriendItems(text: 'Friends', textButton: 'See all', onTap: () {}),
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
