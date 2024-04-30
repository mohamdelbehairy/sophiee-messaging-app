import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/my_friend_page/my_friend_item_one.dart';
import 'package:sophiee/widgets/my_friend_page/my_friends_bottom_send_message.dart';
import 'package:sophiee/widgets/my_friend_page/my_friend_item_bio.dart';
import 'package:sophiee/widgets/my_friend_page/my_friend_items.dart';
import 'package:sophiee/widgets/my_friend_page/my_friend_item_two.dart';
import 'package:sophiee/widgets/my_friend_page/my_friend_list_view.dart';
import 'package:flutter/material.dart';

class MyFriendPage extends StatelessWidget {
  const MyFriendPage({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyFriendItemOne(user: user),
              MyFriendItemTwo(
                  user: user, widget: MyFriendsBottomMessage(user: user)),
              SizedBox(height: size.height * .007),
              MyFriendItems(
                  text: user.userName.split(' ')[0],
                  textButton: 'More',
                  onTap: () {}),
              SizedBox(height: size.height * .02),
              MyFriendItemBio(user: user),
              SizedBox(height: size.height * .026),
              MyFriendItems(
                  text: 'Friends', textButton: 'See all', onTap: () {}),
              SizedBox(height: size.height * .004),
              MyFriendListView(friend: user),
              SizedBox(height: size.height * .02),
              MyFriendItems(
                  text: 'Photos', textButton: 'See all', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
