import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_chat_high_light_state.dart';

class UpdateChatHighLightCubit extends Cubit<UpdateChatHighLightState> {
  UpdateChatHighLightCubit() : super(UpdateChatHighLightInitial());

  Future<void> updateChatHighLightMessage(
      {required String friendID,
      required String messageID,
      required bool highlightChatMessage}) async {
    emit(UpdateChatHighLightLoading());
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('chats')
          .doc(friendID)
          .collection('messages')
          .doc(messageID)
          .update({'highlightChatMessage': highlightChatMessage});
      emit(UpdateChatHighLightSuccess());
    } catch (e) {
      emit(UpdateChatHighLightFailure(errorMessage: e.toString()));
      debugPrint('error from update chat high light message: ${e.toString()}');
    }
  }
}
