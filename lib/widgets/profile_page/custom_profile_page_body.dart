import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/profile_page/app_bar_profile.dart';
import 'package:sophiee/widgets/profile_page/card_one_profile/custom_card_one.dart';
import 'package:sophiee/widgets/profile_page/card_three_profile/custom_card_three.dart';
import 'package:sophiee/widgets/profile_page/card_two_profile/custom_card_two.dart';
import 'package:flutter/material.dart';

class CustomProfilePageBody extends StatelessWidget {
  const CustomProfilePageBody(
      {super.key, required this.onTap, required this.user});
  final Function() onTap;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                const CustomAppBarProfile(),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      CustomProfileCardOne(
                                          user: user, onTap: onTap),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
