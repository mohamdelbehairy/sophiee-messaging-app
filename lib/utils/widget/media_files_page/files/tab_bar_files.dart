import 'package:flutter/material.dart';
import 'package:sophiee/cubit/chat_media_files/chat_get_media_files/chat_get_media_files_cubit.dart';
import 'package:sophiee/cubit/groups/groups_mdeia_files/group_get_media_files/group_get_media_files_cubit.dart';
import 'package:sophiee/utils/widget/media_files_page/custom_text_no_media_files.dart';
import 'package:sophiee/utils/widget/media_files_page/files/tab_bar_files_list_view.dart';

class TabBarFiles extends StatelessWidget {
  const TabBarFiles(
      {super.key, this.filesGroupList, required this.size, this.filesChatList});
  final GroupGetMediaFilesCubit? filesGroupList;
  final ChatGetMediaFilesCubit? filesChatList;
  final Size size;

  @override
  Widget build(BuildContext context) {
    if ((filesGroupList?.filesList != null &&
            filesGroupList!.filesList.isEmpty) ||
        (filesChatList?.filesList != null &&
            filesChatList!.filesList.isEmpty)) {
      return CustomTextNoMediaFiles(size: size, text: 'No files here yet');
    }
    return TabBarFilesListView(
        filesGroupList: filesGroupList,
        filesChatList: filesChatList,
        size: size);
  }
}
