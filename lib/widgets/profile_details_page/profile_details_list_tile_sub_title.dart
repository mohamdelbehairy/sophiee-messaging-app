
import 'package:flutter/material.dart';

import '../../models/users_model.dart';

class ProfileDetailsListTileSubTitle extends StatelessWidget {
  const ProfileDetailsListTileSubTitle(
      {super.key, required this.data, required this.size});

  final UserModel data;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Text(data.bio.isNotEmpty ? data.bio : data.nickName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.grey, fontSize: size.width * .028));
  }
}