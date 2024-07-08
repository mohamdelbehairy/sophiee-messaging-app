import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResentSearchItem extends StatelessWidget {
  const ResentSearchItem({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          const Icon(FontAwesomeIcons.magnifyingGlass,
              color: Color(0xffc9c9d0), size: 18),
          const SizedBox(width: 8),
          Text('Abriella Bond',
              style: TextStyle(
                  fontSize: 16, color: isDark ? Colors.white : Colors.black87)),
        ],
      ),
    );
  }
}
