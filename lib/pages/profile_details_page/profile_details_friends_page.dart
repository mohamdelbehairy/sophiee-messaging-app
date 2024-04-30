import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_state.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/pages/my_friend_page.dart';
import 'package:sophiee/widgets/profile_details_page/tab_bar_items_list_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

class ProfileDetailsFriendsPage extends StatelessWidget {
  const ProfileDetailsFriendsPage({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    Color? color;
    return BlocBuilder<GetFriendsCubit, GetFriendsState>(
      builder: (context, state) {
        if (state is GetFriendsSuccess) {
          return ListView.builder(
              itemCount: state.friends.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    getnav.Get.to(
                        () => MyFriendPage(user: state.friends[index]),
                        transition: getnav.Transition.leftToRight);
                  },
                  child: TabBarItemsListTile(
                    user: state.friends[index],
                    size: size,
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
                          bottom: size.width * .002,
                          child: CircleAvatar(
                            radius: size.width * .022,
                            child: CircleAvatar(
                                radius: size.width * .017,
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
