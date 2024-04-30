import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/follower/follower_cubit.dart';
import 'package:sophiee/cubit/follower/follower_state.dart';
import 'package:sophiee/cubit/friends/friends_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/search_result/search_result_page_body_card.dart';
import 'package:sophiee/widgets/show_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class SearchResultBogy extends StatelessWidget {
  const SearchResultBogy({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final follower = context.read<FollowerCubit>();
    final friend = context.read<FriendsCubit>();
    showToastMethod(
        {required String showToastText,
        required StyledToastPosition position,
        required Color color}) {
      showToastMedthod(
          context: context,
          showToastText: showToastText,
          position: position,
          color: color);
    }

    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = FirebaseAuth.instance.currentUser;
          if (currentUser != null) {
            final userData = state.userModel
                .firstWhere((element) => element.userID == currentUser.uid);
            return BlocListener<FollowerCubit, FollowerState>(
                listener: (context, state) async {
                  if (state is AddFollowerSuccess) {
                    if (state.isFollowing == true) {
                      showToastMethod(
                          color: kPrimaryColor,
                          position: StyledToastPosition.center,
                          showToastText: 'You follow ${user.userName} now.');
                    }
                    if (state.isFollowing &&
                        await follower.followerResult(
                            followerID: user.userID)) {
                      friend.setFriends(
                          friendID: user.userID,
                          userName: user.userName,
                          profileImage: user.profileImage,
                          userID: user.userID,
                          emailAddress: user.emailAddress,
                          meUserName: userData.userName,
                          meProfileImage: userData.profileImage,
                          meEmailAddress: userData.emailAddress);
                      showToastMethod(
                          color: kPrimaryColor,
                          position: StyledToastPosition.center,
                          showToastText:
                              'You and ${user.userName} are now friends.');
                    }
                  }
                  if (state is DeleteFollowerSuccess) {
                    if (!state.isFollowing ||
                        !await follower.followerResult(
                            followerID: user.userID)) {
                      friend.deleteFriends(friendID: user.userID);
                      showToastMethod(
                        color: Colors.red,
                        position: StyledToastPosition.center,
                        showToastText:
                            'You and ${user.userName} can\'t friends now!',
                      );
                      debugPrint('تم حذف الصداقه');
                    }
                  }
                },
                child:
                    SearchResultPageBodyCard(user: user, userData: userData));
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }
}
