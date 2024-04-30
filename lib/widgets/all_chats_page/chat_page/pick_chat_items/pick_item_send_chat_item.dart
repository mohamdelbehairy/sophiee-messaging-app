import 'package:sophiee/constants.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';

class PickItemSendChatItemBottom extends StatelessWidget {
  const PickItemSendChatItemBottom(
      {super.key,
      required this.user,
      required this.onTap,
      this.isClick = false});
  final UserModel user;
  final Function() onTap;
  final bool isClick;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * .025),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size.height * .05,
            width: size.width * .2,
            decoration: BoxDecoration(
                color: const Color(0xff1e2c32),
                borderRadius: BorderRadius.circular(size.height * .032)),
            child: Center(
                child: Text(user.userName.split(' ')[0],
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal))),
          ),
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              radius: size.height * .032,
              backgroundColor: kPrimaryColor,
              child: isClick
                  ? SizedBox(
                      height: size.height * .025,
                      width: size.width * .05,
                      child: const CircularProgressIndicator(color: Colors.white))
                  : const Icon(Icons.send, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
