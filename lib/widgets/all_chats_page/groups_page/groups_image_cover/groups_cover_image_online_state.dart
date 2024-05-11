import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';

import '../../../../constants.dart';
import '../../../../cubit/user_date/get_user_data/get_user_data_cubit.dart';
import '../../../../models/group_model.dart';
import '../../../../models/users_model.dart';

class GroupsCoverImageOnlineState extends StatelessWidget {
  const GroupsCoverImageOnlineState(
      {super.key,
      required this.groupModel,
      required this.size,
      required this.isDark});

  final GroupModel groupModel;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          UserModel? memberData;
          Color color;
          for (var memberID in groupModel.usersID) {
            if (memberID != FirebaseAuth.instance.currentUser!.uid) {
              memberData = state.userModel
                  .firstWhere((element) => element.userID == memberID);
            }
          }
          if (memberData != null) {
            int differenceInMinutes = Timestamp.now()
                .toDate()
                .difference(memberData.onlineStatue)
                .inMinutes;
            color = differenceInMinutes < 1 ? kPrimaryColor : Colors.grey;
            return CircleAvatar(
                radius: size.width * .018,
                backgroundColor: isDark ? kDarkModeColor : Colors.white,
                child: CircleAvatar(
                    radius: size.width * .0135, backgroundColor: color));
          } else {
            return CircleAvatar(
                radius: size.width * .018,
                backgroundColor: isDark ? kDarkModeColor : Colors.white,
                child: CircleAvatar(
                    radius: size.width * .0135, backgroundColor: Colors.grey));
          }
        } else {
          return Container();
        }
      },
    );
  }
}
