import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/models/media_files_model.dart';

part 'chat_get_media_files_state.dart';

class ChatGetMediaFilesCubit extends Cubit<ChatGetMediaFilesState> {
  ChatGetMediaFilesCubit() : super(ChatGetMediaFilesInitial());

  List<MediaFilesModel> mediaList = [];

  void getMedia({required String friendID}) {
    emit(ChatGetMediaFilesLoading());
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('chats')
          .doc(friendID)
          .collection('mediaFiles')
          .doc('media')
          .collection('media')
          .orderBy('dateTime', descending: true)
          .snapshots()
          .listen((snapshot) {
        mediaList = [];
        for (var element in snapshot.docs) {
          mediaList.add(MediaFilesModel.fromJson(element.data()));
        }
        emit(ChatGetMediaSuccess());
      });
    } catch (e) {
      emit(ChatGetMediaFilesFailure(errorMessage: e.toString()));
      debugPrint('error from get media method: ${e.toString()}');
    }
  }

  List<MediaFilesModel> filesList = [];

  void getFiles({required String friendID}) {
    emit(ChatGetMediaFilesLoading());
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('chats')
          .doc(friendID)
          .collection('mediaFiles')
          .doc('files')
          .collection('files')
          .orderBy('dateTime', descending: true)
          .snapshots()
          .listen((snapshot) {
        filesList = [];
        for (var element in snapshot.docs) {
          filesList.add(MediaFilesModel.fromJson(element.data()));
        }
        emit(ChatGetFilesSuccess());
      });
    } catch (e) {
      emit(ChatGetMediaFilesFailure(errorMessage: e.toString()));
      debugPrint('error from get files method: ${e.toString()}');
    }
  }

  List<MediaFilesModel> linksList = [];

  void getLinks({required String friendID}) {
    emit(ChatGetMediaFilesLoading());
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('chats')
          .doc(friendID)
          .collection('mediaFiles')
          .doc('links')
          .collection('links')
          .orderBy('dateTime', descending: true)
          .snapshots()
          .listen((snapshot) {
        linksList = [];
        for (var element in snapshot.docs) {
          linksList.add(MediaFilesModel.fromJson(element.data()));
        }
        emit(ChatGetLinksSuccess());
      });
    } catch (e) {
      emit(ChatGetMediaFilesFailure(errorMessage: e.toString()));
      debugPrint('error from get links method: ${e.toString()}');
    }
  }

  List<MediaFilesModel> voiceList = [];

  void getVoice({required String friendID}) {
    emit(ChatGetMediaFilesLoading());
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('chats')
          .doc(friendID)
          .collection('mediaFiles')
          .doc('voice')
          .collection('voice')
          .orderBy('dateTime', descending: true)
          .snapshots()
          .listen((snapshot) {
        voiceList = [];
        for (var element in snapshot.docs) {
          voiceList.add(MediaFilesModel.fromJson(element.data()));
        }
        emit(ChatGetVoiceSuccess());
      });
    } catch (e) {
      emit(ChatGetMediaFilesFailure(errorMessage: e.toString()));
      debugPrint('error from get voice method: ${e.toString()}');
    }
  }
}
