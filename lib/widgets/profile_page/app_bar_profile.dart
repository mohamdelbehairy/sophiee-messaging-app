import 'package:sophiee/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBarProfile extends StatelessWidget {
  const CustomAppBarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: kPrimaryColor),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Profile',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            // InkWell(
            //   onTap: () {
            //     print('kkkk');
            //   },
            //   child: Icon(
            //     FontAwesomeIcons.ellipsisVertical,
            //     color: Colors.white,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
