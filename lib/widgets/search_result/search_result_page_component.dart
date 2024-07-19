import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/copy_text/copy_text_cubit.dart';
import 'package:sophiee/cubit/is_friend/is_friend_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/utils/widget/flutter_toast_widget.dart';

import '../../cubit/user_date/image/get_image/get_image_cubit.dart';
import '../my_friend_page/my_friend_item_two.dart';
import '../my_friend_page/profile_page_lock_widet.dart';
import 'search_result_details.dart';
import 'search_result_item_one.dart';
import 'search_result_page_body_bottom.dart';

class SearchResultPageComponent extends StatelessWidget {
  const SearchResultPageComponent(
      {super.key, required this.user, required this.userData});
  final UserModel user;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var isDark = context.read<LoginCubit>().isDark;
    var isFriend = context.read<IsFriendCubit>();
    var getImage = context.read<GetImageCubit>();

    return BlocBuilder<IsFriendCubit, IsFriendState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: BlocListener<CopyTextCubit, CopyTextState>(
            listener: (context, state) {
              if (state is CopyTextSuccess) {
                FlutterToastWidget.showToast(msg: "Copied");
              }
            },
            child: Column(
              children: [
                SearchResultItemOne(
                    userData: userData,
                    user: user,
                    size: size,
                    isFriend: isFriend.friends.contains(user.userID)),
                MyFriendItemTwo(
                    userData: userData,
                    user: user,
                    followButton: SearchResultPageBodyBottom(
                        user: user, userData: userData, size: size)),
                if (!isFriend.friends.contains(user.userID))
                  ProfilePageLockWidget(
                      userData: userData,
                      size: size,
                      user: user,
                      isDark: isDark,
                      isFriend: false),
                if (isFriend.friends.contains(user.userID))
                  SearchResultDetails(
                      user: user,
                      isDark: isDark,
                      getImage: getImage,
                      size: size)
              ],
            ),
          ),
        );
      },
    );
  }
}
