import 'package:flutter/material.dart';
import 'package:sophiee/models/media_files_model.dart';

class TabBarLinksListTileSubTitle extends StatelessWidget {
  const TabBarLinksListTileSubTitle(
      {super.key, required this.mediaFiles, required this.size});
  final MediaFilesModel mediaFiles;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(linkType(link: mediaFiles.messageLink!),
            style:
                TextStyle(color: Colors.white60, fontSize: size.width * .03)),
        Text(mediaFiles.showTime(),
            style: TextStyle(color: Colors.white60, fontSize: size.width * .03))
      ],
    );
  }

  String linkType({required String link}) {
    if (link.contains('facebook.com')) {
      return 'facebook';
    } else if (link.contains('google.com')) {
      return 'google';
    } else if (link.contains('youtube.com') || link.contains('youtu.be')) {
      return 'youtube';
    } else if (link.contains('twitter.com')) {
      return 'twitter';
    } else if (link.contains('instagram.com')) {
      return 'instagram';
    } else {
      return 'link';
    }
  }
}
