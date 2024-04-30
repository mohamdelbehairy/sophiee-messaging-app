import 'package:flutter/material.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/models/media_files_model.dart';
import 'package:sophiee/utils/widget/media_files_page/voice/tab_bar_voice_lis_tile_leading.dart';
import 'package:sophiee/utils/widget/media_files_page/voice/tab_bar_voice_list_tile_sub_title.dart';

class TabBarVoiceListTile extends StatelessWidget {
  const TabBarVoiceListTile(
      {super.key, required this.mediaFiles, required this.size});
  final MediaFilesModel mediaFiles;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColor,
      child: ListTile(
        leading: TabBarVoiceListTileLeading(size: size, mediaFiles: mediaFiles),
        title: Text(
            mediaFiles.messageRecord != null
                ? '${mediaFiles.showVoiceDate()} at ${mediaFiles.showVoiceTime()}'
                : mediaFiles.messageSoundName!,
            maxLines: 3,
            overflow: TextOverflow.fade,
            style: TextStyle(color: Colors.white, fontSize: size.width * .035)),
        subtitle: TabBarListTileSubTitle(mediaFiles: mediaFiles, size: size),
      ),
    );
  }
}
