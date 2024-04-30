import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'update_message_audio_playing_state.dart';

class UpdateMessageAudioPlayingCubit
    extends Cubit<UpdateMessageAudioPlayingState> {
  UpdateMessageAudioPlayingCubit() : super(UpdateMessageAudioPlayingInitial());

  Future<void> updateChatMessageAudioPlaying(
      {required String friendID,
      required String messageID,
      required bool messageSoundPlaying}) async {
    emit(UpdateMessageAudioPlayingLoading());
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('chats')
          .doc(friendID)
          .collection('messages')
          .doc(messageID)
          .update({'messageSoundPlaying': messageSoundPlaying});
      emit(UpdateChatMessageAudioPlayingSuccess());
    } catch (e) {
      emit(UpdateMessageAudioPlayingFailure(errroMessage: e.toString()));
      debugPrint(
          'error from update from update message audio playing: ${e.toString()}');
    }
  }

  Future<void> updateGroupMessageAudioPlaying(
      {required String groupID,
      required String messageID,
      required bool messageSoundPlaying}) async {
    emit(UpdateMessageAudioPlayingLoading());
    try {
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .collection('messages')
          .doc(messageID)
          .update({'messageSoundPlaying': messageSoundPlaying});
      emit(UpdateGroupMessageAudioPlayingSuccess());
    } catch (e) {
      emit(UpdateMessageAudioPlayingFailure(errroMessage: e.toString()));
      debugPrint(
          'error from update from update message audio playing: ${e.toString()}');
    }
  }
}
