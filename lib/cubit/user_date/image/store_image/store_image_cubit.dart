import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/models/image_model.dart';
import 'package:uuid/uuid.dart';

part 'store_image_state.dart';

class StoreImageCubit extends Cubit<StoreImageState> {
  StoreImageCubit() : super(StoreImageInitial());

  void storeImage(
      {required String imageUrl,
      required bool isProfileImage,
      required bool isStoryImage}) {
    emit(StoreImageLoading());
    try {
      ImageModel imageModel = ImageModel.fromJson({
        'imageUrl': imageUrl,
        'imageID': const Uuid().v4(),
        'userID': FirebaseAuth.instance.currentUser!.uid,
        'dateTime': Timestamp.now(),
        'isProfileImage': isProfileImage,
        'isStoryImage': isStoryImage
      });

      FirebaseFirestore.instance
          .collection('images')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Images')
          .doc(imageModel.imageID)
          .set(imageModel.toMap());
      emit(StoreImageSuccess());
    } catch (e) {
      emit(StoreImageFailure(errorMessage: e.toString()));
      debugPrint('error from store image method: ${e.toString()}');
    }
  }
}
