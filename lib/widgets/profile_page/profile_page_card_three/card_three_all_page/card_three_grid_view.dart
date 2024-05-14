import 'package:flutter/material.dart';

import '../../../../cubit/user_date/image/get_image/get_image_cubit.dart';
import 'card_three_page_grade_view_images.dart';
import 'card_three_page_grade_view_no_imges.dart';

class CardThreeGridView extends StatelessWidget {
  const CardThreeGridView(
      {super.key,
      required this.getImage,
      required this.isDark,
      required this.size,
      required this.crossAxisCount,
      required this.physics});
  final GetImageCubit getImage;
  final bool isDark;
  final Size size;
  final int crossAxisCount;
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    if (getImage.imageList.isNotEmpty) {
      return CardThreePageGradViewImages(
          physics: physics,
          crossAxisCount: crossAxisCount,
          getImage: getImage,
          isDark: isDark,
          size: size);
    } else {
      return const CardThreePageGradViewNoImages();
    }
  }
}
