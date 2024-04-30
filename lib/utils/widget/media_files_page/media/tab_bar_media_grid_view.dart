import 'package:flutter/material.dart';
import 'package:sophiee/cubit/chat_media_files/chat_get_media_files/chat_get_media_files_cubit.dart';
import 'package:sophiee/cubit/groups/groups_mdeia_files/group_get_media_files/group_get_media_files_cubit.dart';
import 'package:sophiee/utils/widget/media_files_page/media/tab_bar_media_image.dart';
import 'package:sophiee/utils/widget/media_files_page/media/tab_bar_media_video.dart';

class TabBarMediaGridView extends StatelessWidget {
  const TabBarMediaGridView(
      {super.key,
      this.mediaGroupsList,
      required this.size,
      this.mediaChatList});

  final GroupGetMediaFilesCubit? mediaGroupsList;
  final ChatGetMediaFilesCubit? mediaChatList;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .9,
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2),
        itemCount: mediaGroupsList?.mediaList.length ??
            mediaChatList?.mediaList.length,
        itemBuilder: (context, index) {
          if (mediaGroupsList?.mediaList != null) {
            if (mediaGroupsList!.mediaList[index].messageImage != null) {
            return TabBarMediaImage(
                mediaFiels: mediaGroupsList!.mediaList[index]);
          } else {
            return TabBarMediaVideo(
                mediaFiels: mediaGroupsList!.mediaList[index], size: size);
          }
          } else {
            if (mediaChatList!.mediaList[index].messageImage != null) {
            return TabBarMediaImage(
                mediaFiels: mediaChatList!.mediaList[index]);
          } else {
            return TabBarMediaVideo(
                mediaFiels: mediaChatList!.mediaList[index], size: size);
          }
          }
        });
  }
}
