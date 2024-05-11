import 'package:flutter/material.dart';
import 'package:get/get.dart' as getnav;
import 'package:sophiee/pages/chats/groups/create_group/create_group_page.dart';

class NoGroupPageBodyTextButton extends StatelessWidget {
  const NoGroupPageBodyTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          getnav.Get.to(() => const CreateGroupPage(),
              transition: getnav.Transition.rightToLeft);
        },
        child:
            const Text('Create Group', style: TextStyle(color: Colors.blue)));
  }
}
