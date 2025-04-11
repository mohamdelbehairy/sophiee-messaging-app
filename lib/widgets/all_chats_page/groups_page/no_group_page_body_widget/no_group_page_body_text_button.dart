import 'package:flutter/material.dart';

import '../../../../pages/chats/groups/create_group/create_group_page.dart';

class NoGroupPageBodyTextButton extends StatelessWidget {
  const NoGroupPageBodyTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () =>const CreateGroupPage(),
        child:
            const Text('Create Group', style: TextStyle(color: Colors.blue)));
  }
}
