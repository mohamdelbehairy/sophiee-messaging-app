import 'package:flutter/material.dart';

class ChatsIconsAppBarButton extends StatelessWidget {
  const ChatsIconsAppBarButton({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {},
        child: Icon(
          icon,
          size: 25,
        ),
      ),
    );
  }
}
