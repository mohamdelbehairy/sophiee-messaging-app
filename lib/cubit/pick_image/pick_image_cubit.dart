import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageStates> {
  PickImageCubit() : super(PickImageInitial());

  File? selectedImage;

  Future<void> pickImage({required ImageSource source}) async {
    try {
      final returnImage = await ImagePicker().pickImage(source: source);
      if (returnImage != null) {
        selectedImage = File(returnImage.path);
        emit(PickImageSucccess(image: selectedImage!));
      }
    } catch (e) {
      debugPrint('error from pick image cubit: ${e.toString()}');
      emit(PickImageFailure(errorMessage: e.toString()));
    }
  }
}
