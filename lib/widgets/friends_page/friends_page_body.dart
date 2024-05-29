import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_state.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/pages/my_friend_page.dart';
import 'package:sophiee/utils/widget/no_result_found.dart';
import 'package:sophiee/widgets/profile_details_page/list_view_list_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

class FriendsPageBody extends StatefulWidget {
  const FriendsPageBody({super.key, required this.size});
  final Size size;

  @override
  State<FriendsPageBody> createState() => _FriendsPageBodyState();
}

class _FriendsPageBodyState extends State<FriendsPageBody> {
  Color? color;
  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
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
                        transition: getnav.Transition.rightToLeft);
                  },
                  child: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
                    builder: (context, userState) {
                      if (userState is GetUserDataSuccess &&
                          userState.userModel.isNotEmpty) {
                        final friendData = userState.userModel.firstWhere(
                            (element) =>
                                element.userID == state.friends[index].userID);
                        int differenceInMinutes = Timestamp.now()
                            .toDate()
                            .difference(friendData.onlineStatue)
                            .inMinutes;
                        if (differenceInMinutes < 1 &&
                            friendData.isLastSeendAndOnline) {
                          color = kPrimaryColor;
                        } else {
                          color = Colors.grey;
                        }
                        return ListViewListTile(
                          friendData: friendData,
                          size: widget.size,
                          widget: Positioned(
                            right: 0.0,
                            bottom: 0.0,
                            child: CircleAvatar(
                              radius: widget.size.width * .02,
                              backgroundColor: isDark
                                  ? cardDarkModeBackground
                                  : const Color(0xfff1f2f2),
                              child: CircleAvatar(
                                  radius: widget.size.width * .015,
                                  backgroundColor: color),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                );
              });
        } else {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomNoResultFound(
                  image: emptyImageUrl,
                  textOne: 'No Friend Found',
                  textTwo:
                      'We didn\'t find any friends yet \n Please add a new friend'),
            ],
          );
        }
      },
    );
  }
}
