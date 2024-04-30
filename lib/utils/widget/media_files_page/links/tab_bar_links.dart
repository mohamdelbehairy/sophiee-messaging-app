import 'package:flutter/material.dart';
import 'package:sophiee/cubit/chat_media_files/chat_get_media_files/chat_get_media_files_cubit.dart';
import 'package:sophiee/cubit/groups/groups_mdeia_files/group_get_media_files/group_get_media_files_cubit.dart';
import 'package:sophiee/utils/widget/media_files_page/custom_text_no_media_files.dart';
import 'package:sophiee/utils/widget/media_files_page/links/tab_bar_links_list_view.dart';

class TabBarLinks extends StatelessWidget {
  const TabBarLinks(
      {super.key, this.linksGroupList, required this.size, this.linksChatList});
  final GroupGetMediaFilesCubit? linksGroupList;
  final ChatGetMediaFilesCubit? linksChatList;
  final Size size;

  @override
  Widget build(BuildContext context) {
    if ((linksGroupList?.linksList != null &&
            linksGroupList!.linksList.isEmpty) ||
        (linksChatList?.linksList != null &&
            linksChatList!.linksList.isEmpty)) {
      return CustomTextNoMediaFiles(
          size: size, text: 'No shared links here yet');
    }
    return TabBarLinksListView(
        linksGroupList: linksGroupList,
        linksChatList: linksChatList,
        size: size);
  }
}
