import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/profile_page/profile_page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/widgets/profile_page/profile_page_body_scrollable_item.dart';

class ProfilePageBodyComponent extends StatelessWidget {
  const ProfilePageBodyComponent(
      {super.key, required this.user, required this.size});

  final UserModel user;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ProfilePageAppBar(size: size),
                ProfilePageBodyScrollableItem(size: size, user: user)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
