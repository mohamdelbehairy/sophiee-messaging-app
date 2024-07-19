import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../utils/widget/no_result_found.dart';

class NoFollowersPageFoundWidget extends StatelessWidget {
  const NoFollowersPageFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomNoResultFound(
          image: emptyImageUrl,
            textOne: 'No Followers Found',
            textTwo: "You didn't find any followers yet,"),
      ],
    );
  }
}