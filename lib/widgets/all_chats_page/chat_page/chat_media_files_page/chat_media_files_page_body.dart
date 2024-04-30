import 'package:sophiee/cubit/chat_media_files/chat_get_media_files/chat_get_media_files_cubit.dart';
import 'package:sophiee/utils/widget/media_files_page/files/tab_bar_files.dart';
import 'package:sophiee/utils/widget/media_files_page/links/tab_bar_links.dart';
import 'package:sophiee/utils/widget/media_files_page/media/tab_bar_media.dart';
import 'package:sophiee/utils/widget/media_files_page/voice/tab_bar_voice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatMediaFilesPageBody extends StatelessWidget {
  const ChatMediaFilesPageBody(
      {super.key, required this.size, required this.mediaFilesList});
  final Size size;
  final ChatGetMediaFilesCubit mediaFilesList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<ChatGetMediaFilesCubit, ChatGetMediaFilesState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
                child: TabBarView(children: [
              TabBarMedia(mediaChatList: mediaFilesList, size: size),
              TabBarFiles(filesChatList: mediaFilesList, size: size),
              TabBarLinks(linksChatList: mediaFilesList, size: size),
              TabBarVoice(voiceChatList: mediaFilesList, size: size),
            ]))
          ],
        );
      },
    ));
  }
}
