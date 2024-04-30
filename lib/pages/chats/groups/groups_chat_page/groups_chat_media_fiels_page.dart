import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/groups/groups_mdeia_files/group_get_media_files/group_get_media_files_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_media_files_page/groups_chat_media_files_page_body.dart';
import 'package:sophiee/utils/widget/media_files_page/media_files_page_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsChatMediaFilesPage extends StatefulWidget {
  const GroupsChatMediaFilesPage(
      {super.key, required this.groupModel, required this.size});
  final GroupModel groupModel;
  final Size size;

  @override
  State<GroupsChatMediaFilesPage> createState() =>
      _GroupsChatMediaFilesPageState();
}

class _GroupsChatMediaFilesPageState extends State<GroupsChatMediaFilesPage> {
  int titleIndex = 0;

  @override
  void initState() {
    super.initState();
    context
        .read<GroupGetMediaFilesCubit>()
        .getMedia(groupID: widget.groupModel.groupID);
    context
        .read<GroupGetMediaFilesCubit>()
        .getFiles(groupID: widget.groupModel.groupID);
    context
        .read<GroupGetMediaFilesCubit>()
        .getLinks(groupID: widget.groupModel.groupID);

    context
        .read<GroupGetMediaFilesCubit>()
        .getVoice(groupID: widget.groupModel.groupID);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text(widget.groupModel.groupName),
            titleSpacing: widget.size.width * -.01,
            titleTextStyle: TextStyle(fontSize: widget.size.width * .06),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: MediaFilesPageTabBar(
                    onTap: (index) {
                      setState(() {
                        titleIndex = index;
                      });
                    },
                    size: widget.size,
                    titleIndex: titleIndex))),
        body: GroupsChatMediaFilesPageBody(
            size: widget.size, groupModel: widget.groupModel),
      ),
    );
  }
}
