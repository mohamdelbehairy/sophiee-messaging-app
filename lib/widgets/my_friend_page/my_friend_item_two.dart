import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/follow_status/follow_status_cubit.dart';
import 'package:sophiee/cubit/follower/follower_cubit.dart';
import 'package:sophiee/cubit/follower/follower_state.dart';
import 'package:sophiee/cubit/friends/friends_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/show_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../../utils/initial_state.dart';

class MyFriendItemTwo extends StatefulWidget {
  const MyFriendItemTwo({super.key, required this.user, this.widget});
  final UserModel user;
  final Widget? widget;

  @override
  State<MyFriendItemTwo> createState() => _MyFriendItemTwoState();
}

class _MyFriendItemTwoState extends State<MyFriendItemTwo> {
  void showToastMethod({required String showToastText, required Color color}) {
    showToastMedthod(
        color: color,
        context: context,
        showToastText: showToastText,
        position: StyledToastPosition.bottom);
  }

  void initialFriends() {
     InitialState.initFriendState(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final follower = context.read<FollowerCubit>();
    final friend = context.read<FriendsCubit>();
    context
        .read<FollowStatusCubit>()
        .checkFollowStatus(followerID: widget.user.userID);
    final isDark = context.read<LoginCubit>().isDark;
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
        builder: (context, state) {
      if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
        final currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          final userData = state.userModel
              .firstWhere((element) => element.userID == currentUser.uid);
          return BlocConsumer<FollowerCubit, FollowerState>(
            listener: (context, state) async {
              if (state is AddFollowerSuccess) {
                if (state.isFollowing &&
                    await follower.followerResult(
                        followerID: widget.user.userID)) {
                  friend.setFriends(
                      friendID: widget.user.userID,
                      userName: widget.user.userName,
                      profileImage: widget.user.profileImage,
                      userID: widget.user.userID,
                      emailAddress: widget.user.emailAddress,
                      meUserName: userData.userName,
                      meProfileImage: userData.profileImage,
                      meEmailAddress: userData.emailAddress);
                  showToastMethod(
                      color: kPrimaryColor,
                      showToastText: 'You and your follower are now friends!');
                }
              }
              if (state is DeleteFollowerSuccess) {
                if (!state.isFollowing ||
                    !await follower.followerResult(
                        followerID: widget.user.userID)) {
                  friend.deleteFriends(friendID: widget.user.userID);
                  showToastMethod(
                    color: Colors.red,
                    showToastText: 'You and your follower are not friends now!',
                  );
                  debugPrint('تم حذف الصداقه');
                }
              }
            },
            builder: (context, state) {
              return BlocBuilder<FollowStatusCubit, bool>(
                builder: (context, isFollowing) {
                  return Padding(
                    padding: EdgeInsets.all(size.height * .018),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(widget.user.userName,
                                    style: TextStyle(
                                      color:
                                          isDark ? Colors.white : Colors.black,
                                      fontSize: size.width * .042,
                                    )),
                                SizedBox(width: size.width * .01),
                                Container(
                                  height: size.height * .01,
                                  width: size.width * .025,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const Text('@mohamed.mi',
                                style: TextStyle(color: Colors.blue))
                          ],
                        ),
                        widget.widget!,
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (isFollowing) {
                              await follower.deleteFollower(
                                  followerID: widget.user.userID);
                              initialFriends();
                            } else {
                              follower.addFollower(
                                  followerID: widget.user.userID,
                                  userName: widget.user.userName,
                                  profileImage: widget.user.profileImage,
                                  userID: widget.user.userID,
                                  emailAddress: widget.user.emailAddress,
                                  isFollowing: !isFollowing,
                                  meUserName: userData.userName,
                                  meProfileImage: userData.profileImage,
                                  meEmailAddress: userData.emailAddress);
                              initialFriends();
                            }
                          },
                          child: Container(
                            height: size.height * .045,
                            width: size.width * .2,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(size.height * .04),
                              color: isFollowing ? Colors.white : kPrimaryColor,
                              border: isFollowing
                                  ? Border.all(
                                      color: Colors.grey.withOpacity(.2))
                                  : Border.all(color: Colors.transparent),
                            ),
                            child: Center(
                              child: Text(
                                isFollowing ? 'Following' : 'Follow',
                                style: TextStyle(
                                  color: isFollowing
                                      ? kPrimaryColor
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        } else {
          return Container();
        }
      } else {
        return Container();
      }
    });
  }
}
