import 'package:flutter/material.dart';

import '../../../utils/widget/no_result_found.dart';

class NoFollowingPageFoundWidget extends StatelessWidget {
  const NoFollowingPageFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomNoResultFound(
          // image: emptyImageUrl,
            textOne: 'No Following Found',
            textTwo:
                'You didn\'t find any following yet,\nplease follow someone.'),
      ],
    );
  }
}
