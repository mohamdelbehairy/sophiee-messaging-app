import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sophiee/models/message_model.dart';

Future<void> saveSound({required MessageModel messages}) async {
  await Permission.storage.request();

  await FileDownloader.downloadFile(
    url: messages.messageSound != null
        ? messages.messageSound!.trim()
        : messages.messageRecord!.trim(),
    name: messages.messageSound != null
        ? messages.messageSoundName
        : 'record.${DateTime.now().millisecondsSinceEpoch}',
    notificationType: NotificationType.all,
    onDownloadCompleted: (value) {
      debugPrint('Downloaded file path: $value');
    },
    onDownloadError: (errorMessage) {
      debugPrint('error from download file path: $errorMessage');
    },
  );
}
