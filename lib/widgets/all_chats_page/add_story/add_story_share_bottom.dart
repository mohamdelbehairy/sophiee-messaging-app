import 'package:sophiee/constants.dart';
import 'package:flutter/material.dart';

class AddStoryShareBottom extends StatelessWidget {
  const AddStoryShareBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.height * 0.015),
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(size.height * .1)),
      child: Row(
        children: [
          Text('Share Now',
              style:
                  TextStyle(fontSize: size.height * .015, color: Colors.white)),
          SizedBox(width: size.width * .02),
          const Icon(Icons.send_rounded, color: Colors.white),
        ],
      ),
    );
  }
}
