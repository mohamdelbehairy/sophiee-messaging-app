import 'package:flutter/material.dart';

import '../../models/users_model.dart';
import 'my_friend_item_bio.dart';
import 'my_friend_item_one.dart';
import 'my_friend_item_two.dart';
import 'my_friend_items.dart';
import 'my_friend_list_view.dart';
import 'my_friends_bottom_send_message.dart';

class MyFriendPageBody extends StatelessWidget {
  const MyFriendPageBody({super.key, required this.user, required this.size});

  final UserModel user;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyFriendItemOne(user: user),
        MyFriendItemTwo(user: user, widget: MyFriendsBottomMessage(user: user)),
        SizedBox(height: size.height * .007),
        MyFriendItems(
            text: user.userName.split(' ')[0],
            textButton: 'More',
            onTap: () {}),
        SizedBox(height: size.height * .02),
        MyFriendItemBio(user: user),
        SizedBox(height: size.height * .026),
        MyFriendItems(text: 'Friends', textButton: 'See all', onTap: () {}),
        SizedBox(height: size.height * .004),
        MyFriendListView(friend: user),
        SizedBox(height: size.height * .02),
        MyFriendItems(text: 'Photos', textButton: 'See all', onTap: () {}),
      ],
    );
  }
}
