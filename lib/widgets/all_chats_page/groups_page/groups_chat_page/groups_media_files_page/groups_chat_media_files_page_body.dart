import 'package:sophiee/cubit/groups/groups_mdeia_files/group_get_media_files/group_get_media_files_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/utils/widget/media_files_page/files/tab_bar_files.dart';
import 'package:sophiee/utils/widget/media_files_page/links/tab_bar_links.dart';
import 'package:sophiee/utils/widget/media_files_page/media/tab_bar_media.dart';
import 'package:sophiee/utils/widget/media_files_page/voice/tab_bar_voice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsChatMediaFilesPageBody extends StatelessWidget {
  const GroupsChatMediaFilesPageBody(
      {super.key, required this.size, required this.groupModel});
  final Size size;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    var mediaFielsList = context.read<GroupGetMediaFilesCubit>();

    return SafeArea(
        child: BlocBuilder<GroupGetMediaFilesCubit, GroupGetMediaFilesState>(
      builder: (context, state) {
        return Column(children: [
          Expanded(
              child: TabBarView(children: [
            TabBarMedia(mediaGroupsList: mediaFielsList, size: size),
            TabBarFiles(filesGroupList: mediaFielsList, size: size),
            TabBarLinks(linksGroupList: mediaFielsList, size: size),
            TabBarVoice(voiceGroupList: mediaFielsList, size: size),
            // Text('00')
          ]))
        ]);
      },
    ));
  }
}
