import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upload_audio_state.dart';

class UploadAudioCubit extends Cubit<UploadAudioState> {
  UploadAudioCubit() : super(UploadAudioInitial());

  Future<String> uploadAudio({required File audioFile,required String audioField}) async {
    emit(UploadAudioLoading());
    try {
      final audioName =
          'audio_${DateTime.now().microsecondsSinceEpoch.toString()}.mp3';
      Reference reference =
          FirebaseStorage.instance.ref().child('$audioField/$audioName');

      await reference.putFile(audioFile);
      String audioUrl = await reference.getDownloadURL();
      emit(UploadAudioSuccess());
      return audioUrl;
    } catch (e) {
      emit(UploadAudioFailure(errorMessage: e.toString()));
      debugPrint('error from uoload audio cubit: ${e.toString()}');
      return '';
    }
  }
}
