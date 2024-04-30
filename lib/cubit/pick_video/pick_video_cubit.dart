import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sophiee/cubit/pick_video/pick_video_state.dart';

class PickVideoCubit extends Cubit<PickVideoState> {
  PickVideoCubit() : super(PickVideoInitial());

  File? selectedVideo;
  Future<void> pickVideo({required ImageSource source}) async {
    try {
      final returnedVideo = await ImagePicker().pickVideo(source: source);
      if (returnedVideo != null) {
        selectedVideo = File(returnedVideo.path);
        emit(PickVideoSuccess(video: selectedVideo!));
        debugPrint('selectedVideo: $selectedVideo');
      }
    } catch (e) {
      emit(PickVideoFailure(errorMessage: e.toString()));
      debugPrint('error from pick video cubit: ${e.toString()}');
    }
  }
}
