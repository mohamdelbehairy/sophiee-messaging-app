import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/models/media_files_model.dart';

part 'chat_store_media_files_state.dart';

class ChatStoreMediaFilesCubit extends Cubit<ChatStoreMediaFilesState> {
  ChatStoreMediaFilesCubit() : super(ChatStoreMediaFilesInitial());

  Future<void> storeMedia(
      {required String friendID,
      required String messageID,
      String? messageImage,
      String? messageVideo,
      String? messageText}) async {
    emit(ChatStoreMediaFilesLoading());
    try {
      MediaFilesModel mediaFilesModel = MediaFilesModel.fromJson({
        'messageID': messageID,
        'senderID': FirebaseAuth.instance.currentUser!.uid,
        'messageImage': messageImage,
        'messageVideo': messageVideo,
        'messageText': messageText,
        'dateTime': Timestamp.now(),
      });
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('chats')
          .doc(friendID)
          .collection('mediaFiles')
          .doc('media')
          .collection('media')
          .doc(mediaFilesModel.messageID)
          .set(mediaFilesModel.toMap());

      await FirebaseFirestore.instance
          .collection('users')
          .doc(friendID)
          .collection('chats')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('mediaFiles')
          .doc('media')
          .collection('media')
          .doc(mediaFilesModel.messageID)
          .set(mediaFilesModel.toMap());
      emit(ChatStoreMediaFilesStoreMediaSuccess());
    } catch (e) {
      emit(ChatStoreMediaFilessFailure(errorMessage: e.toString()));
      debugPrint('error from store media method: ${e.toString()}');
    }
  }

  Future<void> storeFile({
    required String friendID,
    required String messageID,
    String? messageFile,
    String? messageFileName,
    double? messageFileSize,
    String? messageFileType,
  }) async {
    emit(ChatStoreMediaFilesLoading());
    try {
      MediaFilesModel mediaFilesModel = MediaFilesModel.fromJson({
        'messageID': messageID,
        'senderID': FirebaseAuth.instance.currentUser!.uid,
        'messageFile': messageFile,
        'messageFileName': messageFileName,
        'messageFileSize': messageFileSize,
        'messageFileType': messageFileType,
        'dateTime': Timestamp.now(),
      });
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('chats')
          .doc(friendID)
          .collection('mediaFiles')
          .doc('files')
          .collection('files')
          .doc(mediaFilesModel.messageID)
          .set(mediaFilesModel.toMap());
      await FirebaseFirestore.instance
          .collection('users')
          .doc(friendID)
          .collection('chats')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('mediaFiles')
          .doc('files')
          .collection('files')
          .doc(mediaFilesModel.messageID)
          .set(mediaFilesModel.toMap());
      emit(ChatStoreMediaFilesStoreFilesSuccess());
    } catch (e) {
      emit(ChatStoreMediaFilessFailure(errorMessage: e.toString()));
      debugPrint('error from store files method: ${e.toString()}');
    }
  }

  Future<void> storeLink({
    required String friendID,
    required String messageID,
    String? messageLink,
  }) async {
    emit(ChatStoreMediaFilesLoading());
    try {
      MediaFilesModel mediaFilesModel = MediaFilesModel.fromJson({
        'messageID': messageID,
        'senderID': FirebaseAuth.instance.currentUser!.uid,
        'messageLink': messageLink,
        'dateTime': Timestamp.now(),
      });
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('chats')
          .doc(friendID)
          .collection('mediaFiles')
          .doc('links')
          .collection('links')
          .doc(mediaFilesModel.messageID)
          .set(mediaFilesModel.toMap());
      await FirebaseFirestore.instance
          .collection('users')
          .doc(friendID)
          .collection('chats')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('mediaFiles')
          .doc('links')
          .collection('links')
          .doc(mediaFilesModel.messageID)
          .set(mediaFilesModel.toMap());
      emit(ChatStoreMediaFilesStoreLinksSuccess());
    } catch (e) {
      emit(ChatStoreMediaFilessFailure(errorMessage: e.toString()));
      debugPrint('error from store links method: ${e.toString()}');
    }
  }

  Future<void> storeVoice(
      {required String friendID,
      required String messageID,
      String? messageRecord,
      String? messageSound,
      String? messageSoundName}) async {
    emit(ChatStoreMediaFilesLoading());
    try {
      MediaFilesModel mediaFilesModel = MediaFilesModel.fromJson({
        'messageID': messageID,
        'senderID': FirebaseAuth.instance.currentUser!.uid,
        'messageRecord': messageRecord,
        'messageSound': messageSound,
        'messageSoundName': messageSoundName,
        'dateTime': Timestamp.now(),
      });
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('chats')
          .doc(friendID)
          .collection('mediaFiles')
          .doc('voice')
          .collection('voice')
          .doc(mediaFilesModel.messageID)
          .set(mediaFilesModel.toMap());
      await FirebaseFirestore.instance
          .collection('users')
          .doc(friendID)
          .collection('chats')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('mediaFiles')
          .doc('voice')
          .collection('voice')
          .doc(mediaFilesModel.messageID)
          .set(mediaFilesModel.toMap());
      emit(ChatStoreMediaFilesStoreVoiceSuccess());
    } catch (e) {
      emit(ChatStoreMediaFilessFailure(errorMessage: e.toString()));
      debugPrint('error from store links method: ${e.toString()}');
    }
  }
}
