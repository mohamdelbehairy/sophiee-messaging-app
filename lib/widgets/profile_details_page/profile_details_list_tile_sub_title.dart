import 'package:flutter/material.dart';

import '../../models/users_model.dart';

class ProfileDetailsListTileSubTitle extends StatelessWidget {
  const ProfileDetailsListTileSubTitle(
      {super.key, required this.friendData, required this.size});

  final UserModel friendData;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Text(
        friendData.isBioAndNickName
            ? friendData.bio.isNotEmpty
                ? friendData.bio
                : friendData.nickName
            : '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.grey, fontSize: size.width * .028));
  }
}
