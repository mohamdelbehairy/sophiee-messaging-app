import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/cubit/story/story_cubit.dart';
import 'package:sophiee/models/story_model.dart';
import 'package:sophiee/utils/widget/media/save_video.dart';

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
    var deleteStory = context.read<StoryCubit>();
    return PopupMenuButton(
        color: isDark ? cardDarkModeBackground : cardLightModeBackground,
        offset: const Offset(10, 50),
        icon: Icon(FontAwesomeIcons.ellipsisVertical,
            color: isDark ? Colors.white : Colors.black,
            size: size.width * .05),
        itemBuilder: (context) => [
              groupsInfoPopMenuItem(
                  isDark: isDark,
                  iconSize: size.width * .045,
                  onTap: () async {
                    if (storyModel.storyImage != null) {
                      await saveImage(imageUrl: storyModel.storyImage!);
                      FlutterToastWidget.showToast(
                          msg: "image saved successfully");
                    } else {
                      await saveVideo(videoUel: storyModel.storyVideo!);
                      FlutterToastWidget.showToast(
                          msg: "video saved successfully");
                    }
                  },
                  itemName: 'Save to gallery',
                  size: size,
                  icon: Icons.bookmark_add),
              groupsInfoPopMenuItem(
                  isDark: isDark,
                  onTap: () async {
                    await shareMedia(
                        mediaUrl: storyModel.storyImage != null
                            ? storyModel.storyImage!
                            : storyModel.storyVideo!,
                        mediaType: storyModel.storyImage != null
                            ? 'image.jpg'
                            : 'video.mp4');
                  },
                  itemName: storyModel.storyImage != null
                      ? 'Share image'
                      : 'Share video',
                  size: size,
                  icon: Icons.share),
              groupsInfoPopMenuItem(
                  isDark: isDark,
                  onTap: () async {
                    customShowDialog(
                        context: context,
                        isDark: isDark,
                        doneButtonText: 'Ok',
                        contentText: storyModel.storyImage != null
                            ? 'Are you sure to delete this image?'
                            : 'Are you sure to delete this video?',
                        okFunction: () async {
                          Navigator.pop(context);
                          await deleteStory.deleteOneStory(
                              storyID: storyModel.storyID);
                        });
                  },
                  itemName: storyModel.storyImage != null
                      ? 'Delete image'
                      : 'Delete video',
                  size: size,
                  icon: FontAwesomeIcons.trash)
            ]);
  }
}
