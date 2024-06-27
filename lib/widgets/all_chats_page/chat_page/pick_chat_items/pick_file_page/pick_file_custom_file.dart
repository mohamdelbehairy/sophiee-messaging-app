import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PickFileCustomFile extends StatelessWidget {
  const PickFileCustomFile(
      {super.key, required this.file, required this.isLoading});

  final File file;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return PDFView(
      filePath: file.path,
      enableSwipe: !isLoading,
      swipeHorizontal: false,
      autoSpacing: false,
      onError: (error) {
        debugPrint('error from pdf method: $error');
      },
    );
  }
}
