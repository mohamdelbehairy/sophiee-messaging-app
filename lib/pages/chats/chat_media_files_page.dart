import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/chat_media_files/chat_get_media_files/chat_get_media_files_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/media_files_page/media_files_page_tab_bar.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_media_files_page/chat_media_files_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatMediaFilesPage extends StatefulWidget {
  const ChatMediaFilesPage({super.key, required this.size, required this.user});
  final Size size;
  final UserModel user;

  @override
  State<ChatMediaFilesPage> createState() => _ChatMediaFilesPageState();
}

class _ChatMediaFilesPageState extends State<ChatMediaFilesPage> {
  int titleIndex = 0;
  @override
  void initState() {
    super.initState();
    context
        .read<ChatGetMediaFilesCubit>()
        .getMedia(friendID: widget.user.userID);
    context
        .read<ChatGetMediaFilesCubit>()
        .getFiles(friendID: widget.user.userID);
    context
        .read<ChatGetMediaFilesCubit>()
        .getLinks(friendID: widget.user.userID);

    context
        .read<ChatGetMediaFilesCubit>()
        .getVoice(friendID: widget.user.userID);
  }

  @override
  Widget build(BuildContext context) {
    var mediaFielsList = context.read<ChatGetMediaFilesCubit>();

    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(widget.user.userName),
          titleSpacing: -4,
          titleTextStyle: TextStyle(fontSize: widget.size.width * .055),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: MediaFilesPageTabBar(
                onTap: (index) {
                  setState(() {
                    titleIndex = index;
                  });
                },
                size: widget.size,
                titleIndex: titleIndex),
          ),
        ),
        body: ChatMediaFilesPageBody(
            size: widget.size, mediaFilesList: mediaFielsList),
      ),
    );
  }
}
