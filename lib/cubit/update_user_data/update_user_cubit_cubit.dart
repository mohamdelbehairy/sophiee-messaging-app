import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/update_user_data/update_user_data_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataStates> {
  UpdateUserDataCubit() : super(UpdateUserDataInitial());

  bool isLoading = false;

  Future<void> updateUserData(
      {required String userName,
      required String bio,
      required String nickName,
      required String dateOfBirth,
      required String profileImage,
      required String gender}) async {
    emit(UpdateUserDataLoading(isLoading: true));
    try {
      await FirebaseFirestore.instance
          .collection(userCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'userName': userName,
        'bio': bio,
        'nickName': nickName,
        'dateOfBirth': dateOfBirth,
        'profileImage': profileImage,
        'gender': gender
      });
      isLoading = false;
      emit(UpdateUserDataSuccess());
    } catch (e) {
      emit(UpdateUserFailure(errorMessage: e.toString()));
      emit(UpdateUserDataLoading(isLoading: false));
      debugPrint('error from update user data method: ${e.toString()}');
    }
  }

  Future<void> updateUserField({int? colorValue, String? imageUrl}) async {
    try {
      await FirebaseFirestore.instance
          .collection(userCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'chatbackgroundColor': colorValue,
        'chatbackgroundImage': imageUrl
      });
      emit(UpdateUserDataSuccess());
    } catch (e) {
      emit(UpdateUserFailure(errorMessage: e.toString()));

      debugPrint('error from update user field method: ${e.toString()}');
    }
  }

  Future<void> updateField(
      {required String fieldName, required bool fieldValue}) async {
    try {
      await FirebaseFirestore.instance
          .collection(userCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({fieldName: fieldValue});
      emit(UpdateUserDataSuccess());
    } catch (e) {
      emit(UpdateUserFailure(errorMessage: e.toString()));

      debugPrint('error from update user notification method: ${e.toString()}');
    }
  }

  Future<void> muteUsers({required String userID}) async {
    try {
      await FirebaseFirestore.instance
          .collection(userCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'muteUsers': FieldValue.arrayUnion([userID])
      });
      emit(MuteUserSuccess());
    } catch (e) {
      emit(UpdateUserFailure(errorMessage: e.toString()));

      debugPrint('error from mute users method: ${e.toString()}');
    }
  }

  Future<void> unMuteUsers({required String userID}) async {
    try {
      await FirebaseFirestore.instance
          .collection(userCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'muteUsers': FieldValue.arrayRemove([userID])
      });
      emit(UnMuteUserSuccess());
    } catch (e) {
      emit(UpdateUserFailure(errorMessage: e.toString()));

      debugPrint('error from un mute users method: ${e.toString()}');
    }
  }
}
