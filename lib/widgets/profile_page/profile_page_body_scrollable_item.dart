import 'package:flutter/material.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_one/profile_page_card_one.dart';
import 'package:sophiee/widgets/profile_page/card_three_profile/custom_card_three.dart';
import 'package:sophiee/widgets/profile_page/card_two_profile/custom_card_two.dart';

class ProfilePageBodyScrollableItem extends StatelessWidget {
  const ProfilePageBodyScrollableItem(
      {super.key, required this.size, required this.user, required this.onTap});

  final Size size;
  final UserModel user;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Padding(
        padding: EdgeInsets.only(top: size.height * .056),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: size.height * .045),
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: size.width,
                      child: Column(
                        children: [
                          ProfilePageCardOne(user: user, onTap: onTap,size: size),
                          const SizedBox(height: 10),
                          const CustomProfileCardTwo(),
                          const SizedBox(height: 8),
                          const CustomProfileCardThree(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
