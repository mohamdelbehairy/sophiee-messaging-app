import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/models/message_model.dart';

part 'hight_light_messages_state.dart';

class HightLightMessagesCubit extends Cubit<HightLightMessagesState> {
  HightLightMessagesCubit() : super(HightLightMessagesInitial());

  Future<void> storeHightLightMessages(
      {required String groupID, required MessageModel messageModel}) async {
    emit(HightLightMessagesLoading());
    try {
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .collection('hightLightMessages')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('messages')
          .doc(messageModel.messageID)
          .set(messageModel.toMap());
      emit(StoreHightLightMessagesSuccess());
    } catch (e) {
      emit(StoreHightLightMessagesFailure(errorMessage: e.toString()));
      debugPrint(
          'error message from store hight light message: ${e.toString()}');
    }
  }

  Future<void> removeHightLightMessages(
      {required String groupID, required MessageModel messageModel}) async {
    emit(HightLightMessagesLoading());
    try {
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .collection('hightLightMessages')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('messages')
          .doc(messageModel.messageID)
          .delete();
      emit(RemoveHightLightMessagesSuccess());
    } catch (e) {
      emit(RemoveStoreHightLightMessagesFailure(errorMessage: e.toString()));
      debugPrint(
          'error message from store hight light message: ${e.toString()}');
    }
  }

  List<MessageModel> hightLightMessageList = [];
  void getHightLightMessage({required String groupID}) {
    try {
      FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .collection('hightLightMessages')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('messages')
          .orderBy('messageDateTime', descending: true)
          .snapshots()
          .listen((snapshot) {
        hightLightMessageList = [];
        for (var element in snapshot.docs) {
          hightLightMessageList.add(MessageModel.fromJson(element.data()));
        }
        emit(GetHightLightMessagesSuccess());
      });
    } catch (e) {
      emit(GetHightLightMessagesFailure(errorMessage: e.toString()));
      debugPrint('error from get hight light message: ${e.toString()}');
    }
  }

  Future<void> removeAllHighLightMessages({required String groupID}) async {
    try {
      var document = await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .collection('hightLightMessages')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('messages')
          .get();
      for (QueryDocumentSnapshot snapshot in document.docs) {
        await snapshot.reference.delete();
      }
      await removeUserHighLight(groupID: groupID);
      emit(RemoveAllHightLightMessagesSuccess());
    } catch (e) {
      debugPrint('error from remove all high light method: $e.');
    }
  }

  Future<void> removeUserHighLight({required String groupID}) async {
    try {
      final userID = FirebaseAuth.instance.currentUser!.uid;
      var document = await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .collection('messages')
          .where('hightlightMessage', arrayContains: userID)
          .get();

      final List<Future<void>> futures = [];
      for (var doc in document.docs) {
        final reference = doc.reference;
        final List<dynamic> highlightMessages = doc['hightlightMessage'];
        highlightMessages.remove(userID);
        futures.add(reference.update({'hightlightMessage': highlightMessages}));
      }

      await Future.wait(futures);
    } catch (e) {
      debugPrint('error from remove user high light method: ${e.toString()}');
    }
  }
}
