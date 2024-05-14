import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../cubit/user_date/image/get_image/get_image_cubit.dart';
import 'card_three_grid_view_item.dart';

class CardThreeGridView extends StatelessWidget {
  const CardThreeGridView(
      {super.key,
      required this.getImage,
      required this.isDark,
      required this.size,
      required this.crossAxisCount, required this.physics});
  final GetImageCubit getImage;
  final bool isDark;
  final Size size;
  final int crossAxisCount;
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
        padding: EdgeInsets.zero,
        physics: physics,
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount),
        itemCount: getImage.imageList.length,
        itemBuilder: (context, index) {
          return CardThreeGridViewItem(
              imageModel: getImage.imageList[index],
              isDark: isDark,
              size: size);
        });
  }
}
