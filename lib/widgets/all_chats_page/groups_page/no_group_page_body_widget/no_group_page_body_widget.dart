import 'package:flutter/material.dart';

import 'no_group_page_body_image.dart';
import 'no_group_page_body_text_button.dart';
import 'no_group_page_body_text_one.dart';
import 'no_group_page_body_text_two.dart';

class NoGroupPageBodyWidget extends StatelessWidget {
  const NoGroupPageBodyWidget(
      {super.key, required this.size, required this.isDark});

  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NoGroupPageBodyImage(size: size),
            NoGroupPageBodyTextOne(isDark: isDark, size: size),
            const SizedBox(height: 12),
            const NoGroupPageBodyTextTwo(),
            const NoGroupPageBodyTextButton(),
          ],
        ),
      ],
    );
  }
}
