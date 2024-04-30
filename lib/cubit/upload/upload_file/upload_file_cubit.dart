import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upload_file_state.dart';

class UploadFileCubit extends Cubit<UploadFileState> {
  UploadFileCubit() : super(UploadFileInitial());

  Future<String> uploadFile({required File file,required String fieldName}) async {
    emit(UploadFileLoading());
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference =
          FirebaseStorage.instance.ref().child('$fieldName/$fileName');
      await reference.putFile(file);
      String fileUrl = await reference.getDownloadURL();
      emit(UploadFileSuccess());
      return fileUrl;
    } catch (e) {
      emit(UploadFileFailure(errorMessage: e.toString()));
      debugPrint('error from upload file cubit: ${e.toString()}');
      return '';
    }
  }
}
