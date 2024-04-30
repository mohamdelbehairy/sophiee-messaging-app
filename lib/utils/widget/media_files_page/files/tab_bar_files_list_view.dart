import 'package:flutter/material.dart';
import 'package:sophiee/cubit/chat_media_files/chat_get_media_files/chat_get_media_files_cubit.dart';
import 'package:sophiee/cubit/groups/groups_mdeia_files/group_get_media_files/group_get_media_files_cubit.dart';
import 'package:sophiee/utils/widget/media_files_page/files/tab_bar_files_list_tile.dart';

class TabBarFilesListView extends StatelessWidget {
  const TabBarFilesListView(
      {super.key, this.filesGroupList, required this.size, this.filesChatList});

  final GroupGetMediaFilesCubit? filesGroupList;
  final ChatGetMediaFilesCubit? filesChatList;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:
            filesGroupList?.filesList.length ?? filesChatList?.filesList.length,
        itemBuilder: (context, index) {
          double fileSize = double.parse(
              '${filesGroupList?.filesList[index].messageFileSize! ?? filesChatList?.filesList[index].messageFileSize!}');
          String roundedFileSize = fileSize.toStringAsFixed(1);
          return TabBarFielsListTile(
              size: size,
              mediaFiles: filesGroupList?.filesList[index] ??
                  filesChatList!.filesList[index],
              roundedFileSize: roundedFileSize);
        });
  }
}
