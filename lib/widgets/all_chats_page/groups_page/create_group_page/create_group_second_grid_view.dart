import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGroupSecondGridView extends StatelessWidget {
  const CreateGroupSecondGridView(
      {super.key, required this.size, required this.groupMember});

  final Size size;
  final GroupsMemberSelectedCubit groupMember;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: groupMember.getGroupsMemberSelectedFriendsList.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (context, index) {
            return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
              builder: (context, state) {
                if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
                  final currentUser =
                      groupMember.getGroupsMemberSelectedFriendsList[index];
                  final userData = state.userModel
                      .firstWhere((element) => element.userID == currentUser);
                  return Column(
                    children: [
                      CircleAvatar(
                          radius: size.height * .033,
                          backgroundColor: Colors.transparent,
                          backgroundImage: CachedNetworkImageProvider(
                              userData.profileImage)),
                      SizedBox(height: size.width * .01),
                      Text(userData.userName.split(' ')[0],
                          style: const TextStyle(color: Colors.grey))
                    ],
                  );
                } else {
                  return Container();
                }
              },
            );
          }),
    );
  }
}
