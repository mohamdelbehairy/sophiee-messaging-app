import 'package:flutter/material.dart';

import '../../../constants.dart';

class ListTileTitle extends StatelessWidget {
  const ListTileTitle({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Mohamed Elbehairy',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        const SizedBox(width: 6),
        const Padding(
            padding: EdgeInsets.only(top: 2),
            child: CircleAvatar(radius: 4, backgroundColor: kPrimaryColor))
      ],
    );
  }
}
