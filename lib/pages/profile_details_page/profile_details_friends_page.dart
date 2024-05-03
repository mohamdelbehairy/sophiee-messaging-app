import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_state.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/pages/my_friend_page.dart';
import 'package:sophiee/utils/widget/profile_details_no_item_found.dart';
import 'package:sophiee/widgets/profile_details_page/tab_bar_items_list_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

class ProfileDetailsFriendsPage extends StatefulWidget {
  const ProfileDetailsFriendsPage({super.key, required this.size});
  final Size size;

  @override
  State<ProfileDetailsFriendsPage> createState() =>
      _ProfileDetailsFriendsPageState();
}

class _ProfileDetailsFriendsPageState extends State<ProfileDetailsFriendsPage> {
  Color? color;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFriendsCubit, GetFriendsState>(
      builder: (context, state) {
        if (state is IsFriendsFoundSuccess) {
          return ProfileDetailsNoItemFound(
              size: widget.size,
              textOne: 'No Friends',
              textTwo:
                  'We didn\'t find any friends yet \n Please add a new friend');
        }
        if (state is GetFriendsSuccess) {
          return ListView.builder(
              itemCount: state.friends.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    getnav.Get.to(
                        () => MyFriendPage(user: state.friends[index]),
                        transition: getnav.Transition.rightToLeft);
                  },
                  child: TabBarItemsListTile(
                    user: state.friends[index],
                    size: widget.size,
                    widget: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
                      builder: (context, userState) {
                        if (userState is GetUserDataSuccess &&
                            userState.userModel.isNotEmpty) {
                          final currentUser = state.friends[index].userID;
                          final userData = userState.userModel.firstWhere(
                              (element) => element.userID == currentUser);
                          int differenceInMinutes = Timestamp.now()
                              .toDate()
                              .difference(userData.onlineStatue)
                              .inMinutes;
                          if (differenceInMinutes < 1) {
                            color = kPrimaryColor;
                          } else {
                            color = Colors.grey;
                          }
                        }
                        return Positioned(
                          right: 0.0,
                          bottom: widget.size.width * .002,
                          child: CircleAvatar(
                            radius: widget.size.width * .022,
                            child: CircleAvatar(
                                radius: widget.size.width * .017,
                                backgroundColor: color),
                          ),
                        );
                      },
                    ),
                  ),
                );
              });
        } else {
          return Container();
        }
      },
    );
  }
}
