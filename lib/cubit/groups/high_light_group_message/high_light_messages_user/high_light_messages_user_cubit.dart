import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'high_light_messages_user_state.dart';

class HighLightMessagesUserCubit extends Cubit<HighLightMessagesState> {
  HighLightMessagesUserCubit() : super(HighLightMessagesInitial());

  Future<void> storeHighLightMessageUser(
      {required String groupID, required String messageID}) async {
    emit(HighLightMessagesUserLoading());
    try {
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .collection('messages')
          .doc(messageID)
          .update({
        'highlightMessage':
            FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid])
      });
      emit(StoreHighLightMessageUserSuccess());
    } catch (e) {
      emit(StoreHighLightMessageUserFailure(errorMessage: e.toString()));
      debugPrint('error from store high light user method: ${e.toString()}');
    }
  }

  Future<void> removeHighLightMessageUser(
      {required String groupID, required String messageID}) async {
    emit(HighLightMessagesUserLoading());
    try {
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .collection('messages')
          .doc(messageID)
          .update({
        'highlightMessage':
            FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid])
      });
      emit(RemoveHighLightMessagesSuccess());
    } catch (e) {
      emit(RemoveHighLightMessagesFailure(errorMessage: e.toString()));
      debugPrint('error from remove high light user method: ${e.toString()}');
    }
  }
}
