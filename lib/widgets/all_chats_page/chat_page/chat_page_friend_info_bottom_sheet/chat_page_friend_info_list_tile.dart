import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPageFriendInfoListTile extends StatelessWidget {
  const ChatPageFriendInfoListTile({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return SizedBox(
      width: size.width * .7,
      child: ListTile(
        title: Row(
          children: [
            Text(user.userName,
                style: TextStyle(color: isDark ? Colors.white : Colors.black)),
            const SizedBox(width: 4),
            const CircleAvatar(radius: 4, backgroundColor: kPrimaryColor)
          ],
        ),
        leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: CachedNetworkImageProvider(
                !user.isProfilePhotos ? defaultProfileImageUrl : user.profileImage)),
        subtitle: Text(user.nickName.isNotEmpty ? user.nickName : user.bio,
            style: const TextStyle(color: Colors.blue)),
      ),
    );
  }
}
