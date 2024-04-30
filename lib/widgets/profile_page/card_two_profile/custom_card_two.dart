import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/pages/friends_page.dart';
import 'package:sophiee/widgets/profile_page/card_two_profile/list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

class CustomProfileCardTwo extends StatelessWidget {
  const CustomProfileCardTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(right: size.width * .04, left: size.width * .04),
      child: Container(
        height: size.height * .145,
        width: size.width,
        decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
          BoxShadow(
            blurRadius: 40,
            color: isDark
                ? Colors.grey.withOpacity(.1)
                : Colors.grey.withOpacity(.4),
          ),
        ]),
        child: Card(
          color: isDark ? const Color(0xff2b2c33) : Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size.width * .02)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Friends',
                      style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                          fontSize: size.height * .02),
                    ),
                    TextButton(
                      onPressed: () {
                        getnav.Get.to(() => const FriendsPage(),
                            transition: getnav.Transition.leftToRight);
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: size.width * .04,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              CustomProfileListView(size: size),
              SizedBox(height: size.width * .06)
            ],
          ),
        ),
      ),
    );
  }
}
