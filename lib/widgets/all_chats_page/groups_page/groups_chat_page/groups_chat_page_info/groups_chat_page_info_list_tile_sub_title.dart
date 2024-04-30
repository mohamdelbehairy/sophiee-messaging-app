import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSubTitle extends StatelessWidget {
  const CustomSubTitle(
      {super.key, required this.groupModel, required this.size});

  final GroupModel groupModel;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          UserModel? memberData;
          Color color;
          String? text;
          for (var memberID in groupModel.usersID) {
            if (memberID != FirebaseAuth.instance.currentUser!.uid) {
              memberData = state.userModel
                  .firstWhere((element) => element.userID == memberID);
            }
          }
          if (groupModel.usersID.length == 1) {
            color = Colors.grey;
            text = 'not members yet.';
          } else {
            int differenceInMinutes = Timestamp.now()
                .toDate()
                .difference(memberData!.onlineStatue)
                .inMinutes;
            int differenceInHours = Timestamp.now()
                .toDate()
                .difference(memberData.onlineStatue)
                .inHours;
            int differenceInDays = Timestamp.now()
                .toDate()
                .difference(memberData.onlineStatue)
                .inDays;

            color = differenceInMinutes < 1 ? kPrimaryColor : Colors.grey;
            if (differenceInMinutes < 1) {
              text = 'Active Now';
            } else if (differenceInMinutes < 60) {
              if (differenceInMinutes == 1) {
                text = 'last active$differenceInMinutes minute ago';
              } else {
                text = 'last active $differenceInMinutes minutes ago';
              }
            } else if (differenceInHours < 24) {
              if (differenceInHours == 1) {
                text = 'last active $differenceInHours hour ago';
              } else {
                text = 'last active $differenceInHours hours ago';
              }
            } else if (differenceInDays < 7) {
              if (differenceInDays == 1) {
                text = 'last active $differenceInDays day ago';
              } else {
                text = 'last active $differenceInDays days ago';
              }
            } else {
              int weeks = differenceInDays ~/ 7;
              // int remainingDays = differenceInDays % 7;
              if (weeks == 1) {
                text = 'last active 1 week ago';
              } else {
                text = 'last active $weeks weeks';
                // if (remainingDays > 0) {
                //   text += ' and $remainingDays days';
                // }
                text += ' ago';
              }
            }
          }
          return Row(
            children: [
              CircleAvatar(radius: size.height * .005, backgroundColor: color),
              SizedBox(width: size.width * .015),
              SizedBox(
                width: size.width * .6,
                child: Text(
                    groupModel.groupDescription.isNotEmpty
                        ? groupModel.groupDescription
                        : text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
