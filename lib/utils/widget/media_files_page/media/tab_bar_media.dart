import 'package:flutter/material.dart';
import 'package:sophiee/cubit/chat_media_files/chat_get_media_files/chat_get_media_files_cubit.dart';
import 'package:sophiee/cubit/groups/groups_mdeia_files/group_get_media_files/group_get_media_files_cubit.dart';
import 'package:sophiee/utils/widget/media_files_page/custom_text_no_media_files.dart';
import 'package:sophiee/utils/widget/media_files_page/media/tab_bar_media_grid_view.dart';

class TabBarMedia extends StatelessWidget {
  const TabBarMedia(
      {super.key,
      this.mediaGroupsList,
      required this.size,
      this.mediaChatList});
  final GroupGetMediaFilesCubit? mediaGroupsList;
  final ChatGetMediaFilesCubit? mediaChatList;
  final Size size;

  @override
  Widget build(BuildContext context) {
    if ((mediaGroupsList?.mediaList != null &&
            mediaGroupsList!.mediaList.isEmpty) ||
        (mediaChatList?.mediaList != null &&
            mediaChatList!.mediaList.isEmpty)) {
      return CustomTextNoMediaFiles(
          size: size, text: 'No Media files here yet');
    }
    return TabBarMediaGridView(
        mediaGroupsList: mediaGroupsList,
        mediaChatList: mediaChatList,
        size: size);
  }
}
