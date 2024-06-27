import 'package:flutter/material.dart';

import '../../../models/users_model.dart';

class ItemTopText extends StatelessWidget {
  const ItemTopText(
      {super.key,
      required this.size,
      required this.data,
      required this.isDark});

  final Size size;
  final UserModel data;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * .16,
      child: Center(
        child: Text(
          data.userName.split(' ')[0],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
