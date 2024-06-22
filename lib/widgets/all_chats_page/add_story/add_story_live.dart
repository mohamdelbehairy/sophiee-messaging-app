import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getnav;

import '../../../pages/story/live_page.dart';
import 'add_story_bottom_sheet_item.dart';

class AddStoryLive extends StatelessWidget {
  const AddStoryLive({super.key});

  @override
  Widget build(BuildContext context) {
    return AddStoryBottomSheetItem(
        text: 'start live',
        icon: FontAwesomeIcons.youtube,
        onTap: () {
          Navigator.pop(context);
          getnav.Get.to(
              () => LivePage(
                  liveID: FirebaseAuth.instance.currentUser!.uid, isHost: true),
              transition: getnav.Transition.downToUp);
        });
  }
}
