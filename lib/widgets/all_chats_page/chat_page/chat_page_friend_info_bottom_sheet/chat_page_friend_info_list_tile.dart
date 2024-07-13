import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPageFriendInfoListTile extends StatelessWidget {
  const ChatPageFriendInfoListTile(
      {super.key, required this.user, required this.userData});
  final UserModel user, userData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return SizedBox(
      width: size.width * .72,
      child: ListTile(
        title: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(top: !user.isBioAndNickName ? 8 : 0.0),
                child: Text(user.userName,
                    style: TextStyle(
                        color: isDark ? Colors.white : Colors.black))),
            const SizedBox(width: 4),
            Padding(
                padding: EdgeInsets.only(top: !user.isBioAndNickName ? 8 : 0.0),
                child: const CircleAvatar(
                    radius: 4, backgroundColor: kPrimaryColor))
          ],
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size.height * .035),
            child: FancyShimmerImage(
                boxFit: BoxFit.cover,
                shimmerBaseColor:
                    isDark ? Colors.white12 : Colors.grey.shade300,
                shimmerHighlightColor:
                    isDark ? Colors.white24 : Colors.grey.shade100,
                imageUrl: !user.isProfilePhotos ||
                        userData.blockUsers.contains(user.userID) ||  user.blockUsers.contains(userData.userID)
                    ? defaultProfileImageUrl
                    : user.profileImage),
          ),
        ),
        subtitle: Text(
            user.isBioAndNickName
                ? user.nickName.isNotEmpty
                    ? user.nickName
                    : user.bio
                : '',
            style: const TextStyle(color: Colors.blue)),
      ),
    );
  }
}
