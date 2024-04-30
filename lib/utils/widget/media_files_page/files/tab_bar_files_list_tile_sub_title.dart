import 'package:flutter/material.dart';
import 'package:sophiee/models/media_files_model.dart';

class TabBarFilesListTileSubTitle extends StatelessWidget {
  const TabBarFilesListTileSubTitle(
      {super.key, required this.roundedFileSize, required this.mediaFiels});

  final String roundedFileSize;
  final MediaFilesModel mediaFiels;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$roundedFileSize ${mediaFiels.messageFileType} . PDF',
            style: const TextStyle(color: Colors.white54)),
        Text(mediaFiels.showTime(), style: const TextStyle(color: Colors.white54))
      ],
    );
  }
}
