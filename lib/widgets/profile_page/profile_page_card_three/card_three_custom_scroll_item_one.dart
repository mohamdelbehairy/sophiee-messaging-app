import 'package:flutter/material.dart';

import '../../../utils/widget/profile_page_row_see_all.dart';

class CardThreeCustomScrollItemOne extends StatelessWidget {
  const CardThreeCustomScrollItemOne(
      {super.key, required this.size, required this.isDark});

  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return ProfilePageRowSeeAll(
        size: size,
        isDark: isDark,
        textOne: 'Photos',
        textTwo: 'See all',
        onPressed: () {});
  }
}
