import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

part 'open_files_state.dart';

class OpenFilesCubit extends Cubit<OpenFilesState> {
  OpenFilesCubit() : super(OpenFilesInitial());

  Future<void> openFile(
      {required String fileUrl, required String fileName}) async {
    try {
      String localPath =
          await downloadFileToLocalPath(fileUrl: fileUrl, fileName: fileName);
      OpenFile.open(localPath);
    } catch (e) {
      emit(OpenFilesFailure(errorMessage: e.toString()));
      debugPrint('Error downloading and open file from open file method : $e');
    }
  }

  Future<String> downloadFileToLocalPath(
      {required String fileUrl, required String fileName}) async {
    try {
      String tempDir = (await getTemporaryDirectory()).path;

      await FirebaseStorage.instance
          .refFromURL(fileUrl)
          .writeToFile(File('$tempDir/$fileName'));
      emit(OpenFilesSuccess());
      return '$tempDir/$fileName';
    } catch (e) {
      emit(OpenFilesFailure(errorMessage: e.toString()));
      debugPrint(
          'Error downloading file from downloadFileToLocalPath method : $e');
      rethrow;
    }
  }
}
