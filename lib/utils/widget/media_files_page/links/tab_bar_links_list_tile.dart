import 'package:flutter/material.dart';
import 'package:sophiee/models/media_files_model.dart';
import 'package:sophiee/utils/widget/media_files_page/links/tab_bar_list_tile_sub_title.dart';
import 'package:url_launcher/url_launcher.dart';

class TabBarLinksListTile extends StatelessWidget {
  const TabBarLinksListTile(
      {super.key, required this.mediaFiles, required this.size});

  final MediaFilesModel mediaFiles;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () async {
          await launchUrl(Uri.parse(mediaFiles.messageLink!));
        },
        leading: const Icon(Icons.link, color: Colors.white),
        title: Text(mediaFiles.messageLink!,
            maxLines: 4,
            overflow: TextOverflow.fade,
            style: TextStyle(color: Colors.white, fontSize: size.width * .03)),
        subtitle:
            TabBarLinksListTileSubTitle(mediaFiles: mediaFiles, size: size));
  }
}
