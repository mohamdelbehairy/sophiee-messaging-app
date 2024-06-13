import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getnav;
import 'package:sophiee/pages/chats/chat_page.dart';

import '../../constants.dart';
import '../../models/users_model.dart';
import '../../utils/widget/media/save_image.dart';
import '../../utils/widget/media/share_media.dart';
import '../../utils/widget/pop_menu_info_item.dart';

class MyFriendPageIconElispes extends StatelessWidget {
  const MyFriendPageIconElispes(
      {super.key, required this.user, required this.size});

  final UserModel user;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 8,
        top: 50,
        child: PopupMenuButton(
            color: kPrimaryColor,
            icon: const Icon(FontAwesomeIcons.ellipsisVertical,
                color: Colors.white, size: 25),
            itemBuilder: (context) => [
                  groupsInfoPopMenuItem(
                      onTap: () async {
                        await shareMedia(
                            mediaUrl: user.profileImage,
                            mediaType: 'image.jpg');
                      },
                      itemName: 'Share Image',
                      size: size,
                      icon: Icons.share),
                  groupsInfoPopMenuItem(
                      onTap: () async {},
                      itemName: 'Block ${user.userName.split(' ')[0]}',
                      size: size,
                      icon: Icons.block),
                  groupsInfoPopMenuItem(
                      onTap: () {
                        getnav.Get.to(() => ChatPage(userID: user.userID),
                            transition: getnav.Transition.rightToLeft);
                      },
                      itemName: 'Start Chat',
                      size: size,
                      icon: Icons.chat_outlined),
                  groupsInfoPopMenuItem(
                      onTap: () async {
                        await saveImage(imageUrl: user.profileImage);
                      },
                      itemName: 'Save to Gallery',
                      size: size,
                      icon: Icons.save),
                ]));
  }
}
