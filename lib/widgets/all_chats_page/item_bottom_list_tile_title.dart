import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemBottomListTileTitle extends StatelessWidget {
  const ItemBottomListTileTitle(
      {super.key,
      required this.data,
      required this.user,
      required this.isMute});
  final UserModel data;
  final UserModel user;
  final bool isMute;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    final size = MediaQuery.of(context).size;
    Timestamp timestamp = user.lastMessage!['lastMessageDateTime'];
    DateTime dateTime = timestamp.toDate();
    int differenceInMinutes =
        Timestamp.now().toDate().difference(dateTime).inMinutes;
    int differenceInHours =
        Timestamp.now().toDate().difference(dateTime).inHours;
    int differenceInDays = Timestamp.now().toDate().difference(dateTime).inDays;
    int weeks = differenceInDays ~/ 7;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              data.userName,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(width: size.width * .02),
            if (user.lastMessage?['senderID'] !=
                    FirebaseAuth.instance.currentUser!.uid &&
                !user.lastMessage?['isSeen'])
              Padding(
                padding: EdgeInsets.only(top: size.width * .012),
                child: CircleAvatar(
                  radius: size.width * .014,
                  backgroundColor: kPrimaryColor,
                ),
              ),
            if (isMute) const SizedBox(width: 8),
            if (isMute)
              Icon(Icons.volume_off,
                  color: isDark ? Colors.white54 : Colors.grey),
          ],
        ),
        Text(
          differenceInMinutes < 1
              ? 'now'
              : differenceInMinutes < 60
                  ? '$differenceInMinutes m ago'
                  : differenceInHours < 24
                      ? '$differenceInHours h ago'
                      : differenceInDays == 1
                          ? 'Yesterday'
                          : differenceInDays < 7
                              ? '$differenceInDays d ago'
                              : weeks == 1
                                  ? '1 w'
                                  : '$weeks w ago',
          style: TextStyle(
              color: user.lastMessage?['isSeen'] &&
                      user.lastMessage?['senderID'] !=
                          FirebaseAuth.instance.currentUser!.uid
                  ? Colors.grey
                  : user.lastMessage?['senderID'] ==
                          FirebaseAuth.instance.currentUser!.uid
                      ? isDark
                          ? Colors.white
                          : Colors.black
                      : isDark
                          ? Colors.white
                          : Colors.black,
              fontSize: size.width * .03),
        )
      ],
    );
  }
}
