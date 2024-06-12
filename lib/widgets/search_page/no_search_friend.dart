import 'package:flutter/material.dart';

import '../../constants.dart';

class NoSearchFriend extends StatelessWidget {
  const NoSearchFriend({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(searchFriendsImageUrl),
        ),
      ),
    );
  }
}
