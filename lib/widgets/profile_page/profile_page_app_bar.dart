import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/constants.dart';
import 'package:flutter/material.dart';

class ProfilePageAppBar extends StatelessWidget {
  const ProfilePageAppBar({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .163,
      width: size.width,
      decoration: const BoxDecoration(color: kPrimaryColor),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text('My Profile',
                style: TextStyle(
                    fontSize: size.height *.034,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            InkWell(
              onTap: () {},
              child: const Icon(
                FontAwesomeIcons.ellipsisVertical,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
