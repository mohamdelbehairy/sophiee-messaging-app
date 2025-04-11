import 'package:flutter/material.dart';
import 'package:sophiee/utils/navigation.dart';
import '../../../../constants.dart';
import '../../../../pages/chats/groups/create_group/create_group_page.dart';

class CustomCreateGroupBody extends StatelessWidget {
  const CustomCreateGroupBody({super.key, required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? cardDarkModeBackground : Colors.white,
      elevation: isDark ? 1 : 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () => Navigation.push(context, const CreateGroupPage()),
              child: CircleAvatar(
                  radius: 25,
                  backgroundColor: isDark
                      ? const Color(0xff4a4b50)
                      : Colors.grey.withValues(alpha:  .15),
                  child: Icon(Icons.add,
                      color: isDark ? const Color(0xffd2d1d8) : Colors.grey))),
          const SizedBox(height: 6),
          Text('Create New',
              style: TextStyle(color: isDark ? Colors.white : Colors.black))
        ],
      ),
    );
  }
}
