import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upload_video_state.dart';

class UploadVideoCubit extends Cubit<UploadVideoState> {
  UploadVideoCubit() : super(UploadVideoInitial());

  bool isLoading = false;
  Future<String> uploadVideo(
      {required File videoFile, required String fieldName}) async {
    emit(UploadVideoLoading(isLoading: true));
    try {
      String videoName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference =
          FirebaseStorage.instance.ref().child('$fieldName/$videoName');

      await reference.putFile(videoFile);
      String videoUrl = await reference.getDownloadURL();
      emit(UploadVideoSuccess());
      emit(UploadVideoLoading(isLoading: false));
      return videoUrl;
    } catch (e) {
      emit(UploadVideoFailure(errorMessage: e.toString()));
      emit(UploadVideoLoading(isLoading: false));
      debugPrint('error from upload video cubit: ${e.toString()}');
      return '';
    }
  }
}
