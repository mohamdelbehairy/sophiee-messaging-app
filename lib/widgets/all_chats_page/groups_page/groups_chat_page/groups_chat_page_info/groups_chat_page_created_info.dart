import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsChatPageCreatedInfo extends StatelessWidget {
  const GroupsChatPageCreatedInfo(
      {super.key, required this.size, required this.groupData});

  final Size size;
  final GroupModel groupData;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .06),
        child: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
          builder: (context, state) {
            if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
              final currentUser = groupData.groupOwnerID;
              final userData = state.userModel
                  .firstWhere((element) => element.userID == currentUser);
              return Text(
                  'Created by ${groupData.groupOwnerID == FirebaseAuth.instance.currentUser!.uid ? 'you' : userData.userName}, ${groupData.groupCreatedFormatted()}',
                  style: TextStyle(
                      color: Colors.grey, fontSize: size.width * .034));
            } else {
              return Container();
            }
          },
        ));
  }
}
