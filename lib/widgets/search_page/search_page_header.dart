import 'package:flutter/material.dart';

class SearchPageHeader extends StatelessWidget {
  const SearchPageHeader(
      {super.key,
      required this.isDark,
      required this.size,
      required this.controller});

  final bool isDark;
  final Size size;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Recent Search',
            style: TextStyle(
                color: isDark ? Colors.white : const Color(0xffb0afb4),
                fontSize: size.width * .04)),
        if (controller.text.isEmpty)
          Text('Clear History',
              style: TextStyle(color: Colors.blue, fontSize: size.width * .04)),
      ],
    );
  }
}
