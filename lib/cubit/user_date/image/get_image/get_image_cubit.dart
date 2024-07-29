import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/image_model.dart';

part 'get_image_state.dart';

class GetImageCubit extends Cubit<GetImageState> {
  GetImageCubit() : super(GetImageInitial());

  List<ImageModel> imageList = [];
  void getImage({required String userID}) {
    emit(GetImageLoading());
    try {
      FirebaseFirestore.instance
          .collection('images')
          .doc(userID)
          .collection('Images')
          .orderBy('dateTime', descending: true)
          .snapshots()
          .listen((snapshot) {
        imageList = [];

        for (var element in snapshot.docs) {
          imageList.add(ImageModel.fromJson(element.data()));
        }
        emit(GetImageSuccess());
      });
    } catch (e) {
      emit(GetImageFailure(errorMessage: e.toString()));
      debugPrint('error from get image method: $e');
    }
  }
}
