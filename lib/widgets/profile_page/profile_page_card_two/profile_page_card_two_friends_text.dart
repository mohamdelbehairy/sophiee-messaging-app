import 'package:flutter/material.dart';
import 'package:sophiee/pages/friends_page.dart';
import 'package:get/get.dart' as getnav;

class ProfilePageCardTwoFriendsText extends StatelessWidget {
  const ProfilePageCardTwoFriendsText(
      {super.key, required this.size, required this.isDark});

  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Friends',
              style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: size.height * .02)),
          TextButton(
            onPressed: () {
              getnav.Get.to(() => const FriendsPage(),
                  transition: getnav.Transition.rightToLeft);
            },
            child: Text(
              'See all',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: size.width * .04,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
