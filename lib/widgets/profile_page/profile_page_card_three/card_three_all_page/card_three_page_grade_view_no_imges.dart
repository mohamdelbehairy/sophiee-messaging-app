import 'package:flutter/material.dart';

import '../../../../utils/widget/no_result_found.dart';

class CardThreePageGradViewNoImages extends StatelessWidget {
  const CardThreePageGradViewNoImages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomNoResultFound(
          // image: emptyImageUrl,
            textOne: 'No Images here',
            textTwo:
                'We didn\'t find any images yet \n Please add a new image'),
      ],
    );
  }
}
