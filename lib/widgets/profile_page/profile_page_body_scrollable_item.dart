import 'package:flutter/material.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_one/profile_page_card_one.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_three/profile_page_card_three.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_two/profile_page_card_two.dart';

class ProfilePageBodyScrollableItem extends StatelessWidget {
  const ProfilePageBodyScrollableItem(
      {super.key, required this.size, required this.user});

  final Size size;
  final UserModel user;

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
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * .035),
                        child: Column(
                          children: [
                            ProfilePageCardOne(user: user, size: size),
                            SizedBox(height: size.width * .02),
                            ProfilePageCardTwo(size: size),
                            SizedBox(height: size.width * .02),
                            ProfilePageCardThree(size: size),
                          ],
                        ),
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
