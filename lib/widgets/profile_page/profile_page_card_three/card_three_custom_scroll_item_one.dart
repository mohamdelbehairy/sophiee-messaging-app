import 'package:flutter/material.dart';
import 'package:get/get.dart' as getnav;

import '../../../cubit/user_date/image/get_image/get_image_cubit.dart';
import '../../../utils/widget/profile_page_row_see_all.dart';
import '../../../pages/card_three_see_all_page.dart';

class CardThreeCustomScrollItemOne extends StatelessWidget {
  const CardThreeCustomScrollItemOne(
      {super.key,
      required this.size,
      required this.isDark,
      required this.getImage});

  final GetImageCubit getImage;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return ProfilePageRowSeeAll(
        size: size,
        isDark: isDark,
        textOne: 'Photos',
        textTwo: 'See all',
        onPressed: () => getnav.Get.to(
            () => CardThreeSeeAllPage(
                isDark: isDark, getImage: getImage, size: size),
            transition: getnav.Transition.downToUp));
  }
}
