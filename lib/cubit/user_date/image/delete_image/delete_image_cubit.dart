import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_image_state.dart';

class DeleteImageCubit extends Cubit<DeleteImageState> {
  DeleteImageCubit() : super(DeleteImageInitial());

  Future<void> deleteImage({required String imageID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('images')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Images')
          .doc(imageID)
          .delete();
      emit(DeleteImageSuccess());
    } catch (e) {
      emit(DeleteImageFailure(errorMessage: e.toString()));
      debugPrint('error from delete image method: ${e.toString()}');
    }
  }
}
