import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsChatAddMembersListTile extends StatefulWidget {
  const GroupsChatAddMembersListTile(
      {super.key,
      required this.size,
      required this.groupModel,
      required this.user});

  final Size size;
  final GroupModel groupModel;
  final UserModel user;

  @override
  State<GroupsChatAddMembersListTile> createState() =>
      _GroupsChatAddMembersListTileState();
}

class _GroupsChatAddMembersListTileState
    extends State<GroupsChatAddMembersListTile> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var selectedMembers = context.read<GroupsMemberSelectedCubit>();
    var isDark = context.read<LoginCubit>().isDark;
    return GestureDetector(
      onTap: () async {
        setState(() {
          isSelected = !isSelected;
        });
        if (!widget.groupModel.usersID.contains(widget.user.userID)) {
          if (isSelected) {
            await selectedMembers.groupsMemberSelected(
                selectedFriendID: widget.user.userID,
                userName: widget.user.userName,
                profileImage: widget.user.profileImage,
                userID: widget.user.userID);
          } else {
            await selectedMembers.deleteGroupsMemberSelectedFriends(
                selectedFriendID: widget.user.userID);
          }
          debugPrint(
              'getGroupsMemberSelectedFriendsList: ${selectedMembers.getGroupsMemberSelectedFriendsList.length}');
        }
      },
      child: BlocBuilder<GroupsMemberSelectedCubit, GroupsMemberSelectedState>(
        builder: (context, state) {
          return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
            builder: (context, state) {
              if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
                final currnetUser = widget.user.userID;
                final data = state.userModel
                    .firstWhere((element) => element.userID == currnetUser);
                return ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(
                        top: !widget.groupModel.usersID
                                .contains(widget.user.userID)
                            ? 10
                            : 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data.userName),
                        if (!widget.groupModel.usersID
                            .contains(widget.user.userID))
                          Container(
                            height: widget.size.height * .022,
                            width: widget.size.width * .05,
                            color: isSelected
                                // &&
                                // selectedFriends
                                //     .getGroupsMemberSelectedFriendsList.isNotEmpty
                                ? kPrimaryColor
                                : Colors.grey,
                            child: isSelected
                                //     &&
                                // selectedFriends
                                //     .getGroupsMemberSelectedFriendsList.isNotEmpty
                                ? Icon(Icons.done,
                                    size: widget.size.height * .022,
                                    color: Colors.white)
                                : Container(),
                          )
                      ],
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: widget.size.height * .028,
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: FancyShimmerImage(
                          boxFit: BoxFit.cover,
                          shimmerBaseColor:
                              isDark ? Colors.white12 : Colors.grey.shade300,
                          shimmerHighlightColor:
                              isDark ? Colors.white24 : Colors.grey.shade100,
                          imageUrl: data.profileImage),
                    ),
                  ),
                  subtitle: Text(
                      widget.groupModel.usersID.contains(widget.user.userID)
                          ? 'Already added to the group'
                          : data.bio),
                );
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}
