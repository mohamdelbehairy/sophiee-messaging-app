import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/models/story_model.dart';

import '../../../constants.dart';
import '../../../utils/custom_show_dialog.dart';
import '../../../utils/widget/flutter_toast_widget.dart';
import '../../../utils/widget/media/save_image.dart';
import '../../../utils/widget/media/share_media.dart';
import '../../../utils/widget/pop_menu_info_item.dart';

class MyStoryPageTrailing extends StatelessWidget {
  const MyStoryPageTrailing(
      {super.key,
      required this.size,
      required this.isDark,
      required this.storyModel});
  final Size size;
  final bool isDark;
  final StoryModel storyModel;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        color: isDark ? cardDarkModeBackground : cardLightModeBackground,
        offset: const Offset(10, 50),
        icon: Icon(FontAwesomeIcons.ellipsisVertical,
            color: isDark ? Colors.white : Colors.black,
            size: size.width * .05),
        itemBuilder: (context) => [
              groupsInfoPopMenuItem(
                  isDark: isDark,
                  onTap: () async {
                    await saveImage(imageUrl: storyModel.storyImage!);
                    FlutterToastWidget.showToast(
                        msg: "Image saved successfully");
                  },
                  itemName: 'Save to gallery',
                  size: size,
                  icon: Icons.save_alt_outlined),
              groupsInfoPopMenuItem(
                  isDark: isDark,
                  onTap: () async {
                    await shareMedia(
                        mediaUrl: storyModel.storyImage!,
                        mediaType: 'image.jpg');
                  },
                  itemName: 'Share image',
                  size: size,
                  icon: Icons.share),
              groupsInfoPopMenuItem(
                  isDark: isDark,
                  onTap: () async {
                    customShowDialog(
                        context: context,
                        isDark: isDark,
                        doneButtonText: 'Ok',
                        contentText: 'Are you sure to delete image?',
                        okFunction: () async {
                          Navigator.pop(context);
                          // await deleteImage.deleteImage(
                          //     imageID: imageModel.imageID);
                        });
                  },
                  itemName: 'Delete image',
                  size: size,
                  icon: FontAwesomeIcons.trash)
            ]);
  }
}

