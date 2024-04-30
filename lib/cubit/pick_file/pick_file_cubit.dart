import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/pick_file/pick_file_state.dart';

class PickFileCubit extends Cubit<PickFileState> {
  PickFileCubit() : super(PickFileInital());

  File? selectedFile;
  Future<void> pickFile({
    required List<String> allowedExtensions
    }) async {
    try {
      final returnFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions:allowedExtensions,
      );
      if (returnFile != null) {
        selectedFile = File(returnFile.files.first.path!);
        debugPrint('selectedFile: $selectedFile');
        emit(PickFileSuccess(file: selectedFile!));
      }
    } catch (e) {
      emit(PickFileFailure(errorMessage: e.toString()));
      debugPrint('error from pick file cubit: ${e.toString()}');
    }
  }
}
