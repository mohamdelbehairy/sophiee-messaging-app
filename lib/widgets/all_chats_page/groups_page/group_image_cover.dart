import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsCoverImage extends StatelessWidget {
  const GroupsCoverImage(
      {super.key, required this.groupModel, required this.isDark});
  final GroupModel groupModel;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.transparent,
          // backgroundImage: NetworkImage(groupModel.groupImage!),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FancyShimmerImage(
                boxFit: BoxFit.cover,
                shimmerBaseColor:
                    isDark ? Colors.white12 : Colors.grey.shade300,
                shimmerHighlightColor:
                    isDark ? Colors.white24 : Colors.grey.shade100,
                imageUrl: groupModel.groupImage!),
          ),
        ),
        BlocBuilder<GetUserDataCubit, GetUserDataStates>(
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
                  radius: 8,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: color,
                  ),
                );
              } else {
                return const CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.grey,
                  ),
                );
              }
            } else {
              return Container();
            }
          },
        )
      ],
    );
  }
}
