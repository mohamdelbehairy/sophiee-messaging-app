import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';

import '../my_friend_page/my_friend_item_two.dart';
import '../my_friend_page/profile_page_lock_widet.dart';
import 'search_result_item_one.dart';
import 'search_result_page_body_bottom.dart';

class SearchResultPageComponent extends StatelessWidget {
  const SearchResultPageComponent(
      {super.key, required this.user, required this.userData});
  final UserModel user;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var isDark = context.read<LoginCubit>().isDark;

    return Column(
      children: [
        SearchResultItemOne(user: user, size: size),
        MyFriendItemTwo(
            user: user,
            followButton: SearchResultPageBodyBottom(
                user: user, userData: userData, size: size)),
        ProfilePageLockWidget(
            size: size, user: user, isDark: isDark, isFriend: false),
      ],
    );
  }
}
