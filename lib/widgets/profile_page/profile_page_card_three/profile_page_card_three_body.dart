import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../cubit/user_date/image/get_image/get_image_cubit.dart';
import 'card_three_custom_scroll_item_one.dart';
import 'card_three_custom_scroll_item_two.dart';

class ProfilePageCardThreeBody extends StatelessWidget {
  const ProfilePageCardThreeBody(
      {super.key,
      required this.isDark,
      required this.size,
      required this.getImage});

  final bool isDark;
  final Size size;
  final GetImageCubit getImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? cardDarkModeBackground : cardLightModeBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * .02)),
      child: CustomScrollView(
        physics: getImage.imageList.isEmpty || getImage.imageList.length > 15
            ? const NeverScrollableScrollPhysics()
            : const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: CardThreeCustomScrollItemOne(
                  size: size, isDark: isDark, getImage: getImage)),
          SliverToBoxAdapter(
              child: CardThreeCustomScrollItemTwo(
                  getImage: getImage, size: size, isDark: isDark))
        ],
      ),
    );
  }
}
