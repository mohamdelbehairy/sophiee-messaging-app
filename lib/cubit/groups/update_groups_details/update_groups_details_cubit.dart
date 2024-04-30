import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_groups_details_state.dart';

class UpdateGroupsDetailsCubit extends Cubit<UpdateGroupsDetailsState> {
  UpdateGroupsDetailsCubit() : super(UpdateGroupsDetailsInitial());

  Future<void> updateGroupInfo(
      {required String groupID,
      required String groupField,
      required String groupValue}) async {
    emit(UpdateGroupsDetailsLoading());
    try {
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .update({
        groupField: groupValue,
      });
      emit(UpdateGroupsInfoSuccess());
    } catch (e) {
      emit(UpdateGroupsDetailsFailure(errorMessage: e.toString()));
      debugPrint('error from update group name method: ${e.toString()}');
    }
  }

  bool isLoading = false;
  Future<void> updateGroupImage(
      {required String groupID, required File groupImageFile}) async {
    emit(UpdateGroupsImageLoading(isLoading: true));
    try {
      String imageUrl =
          await uploadGroupImageEditing(groupImageFile: groupImageFile);
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .update({
        'groupImage': imageUrl,
      });
      isLoading = false;
      emit(UpdateGroupsImageSuccess());
    } catch (e) {
      emit(UpdateGroupsDetailsFailure(errorMessage: e.toString()));
      debugPrint('error from update group image method: ${e.toString()}');
      isLoading = false;
    }
  }

  Future<String> uploadGroupImageEditing({required File groupImageFile}) async {
    try {
      String imageName = DateTime.now().microsecondsSinceEpoch.toString();
      Reference reference = FirebaseStorage.instance
          .ref()
          .child('groups_image_editing/$imageName');
      await reference.putFile(groupImageFile);
      String imageUrl = await reference.getDownloadURL();
      emit(UploadGroupImageEditingSuccess());

      return imageUrl;
    } catch (e) {
      emit(UploadGroupImageEditingFailure(
          errorMessage:
              'error from upload image group editing method: ${e.toString()}'));

      return '';
    }
  }
}
