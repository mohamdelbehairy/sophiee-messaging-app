
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/models/message_model.dart';

part 'chat_high_light_message_state.dart';

class ChatHighLightMessageCubit extends Cubit<ChatHighLightMessageState> {
  ChatHighLightMessageCubit() : super(ChatHighLightMessageInitial());

  Future<void> storeChatHighLightMessage(
      {required String friendID, required MessageModel messageModel}) async {
    emit(ChatHighLightMessageLoading());
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('chats')
          .doc(friendID)
          .collection('highlightMessage')
          .doc(messageModel.messageID)
          .set(messageModel.toMap());
      emit(ChatStoreHighLightMessageSuccess());
    } catch (e) {
      emit(ChatHighLightMessageFailure(errorMessage: e.toString()));
      debugPrint(
          'error message from store chat hight light message: ${e.toString()}');
    }
  }

  Future<void> removeChatHighLightMessage(
      {required String friendID, required MessageModel messageModel}) async {
    emit(ChatHighLightMessageLoading());
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('chats')
          .doc(friendID)
          .collection('highlightMessage')
          .doc(messageModel.messageID)
          .delete();
      emit(ChatRemoveHighLightMessageSuccess());
    } catch (e) {
      emit(ChatHighLightMessageFailure(errorMessage: e.toString()));
      debugPrint(
          'error message from remove chat hight light message: ${e.toString()}');
    }
  }

  List<MessageModel> hightLightMessageList = [];

  void getHightLightMessage({required String friendID}) {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('chats')
          .doc(friendID)
          .collection('highlightMessage')
          .orderBy('messageDateTime', descending: true)
          .snapshots()
          .listen((snapshot) {
        hightLightMessageList = [];
        for (var element in snapshot.docs) {
          hightLightMessageList.add(MessageModel.fromJson(element.data()));
        }
        emit(ChatGetHighLightMessageSuccess());
      });
    } catch (e) {
      emit(ChatHighLightMessageFailure(errorMessage: e.toString()));
      debugPrint('error from get chat hight light message: ${e.toString()}');
    }
  }

  Future<void> removeAllHighLightMessages({required String friendID}) async {
    try {
      var document = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('chats')
          .doc(friendID)
          .collection('highlightMessage')
          .get();
      for (QueryDocumentSnapshot snapshot in document.docs) {
        snapshot.reference.delete();
      }
      await updateAllHighLightMessages(friendID: friendID);
      emit(ChatRemoveAllHighLightMessageSuccess());
    } catch (e) {
      emit(ChatHighLightMessageFailure(errorMessage: e.toString()));
      debugPrint('error from remove all high light method: ${e.toString()}');
    }
  }

  Future<void> updateAllHighLightMessages({required String friendID}) async {
    try {
      QuerySnapshot mesaage = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('chats')
          .doc(friendID)
          .collection('messages')
          .get();

      for (var element in mesaage.docs) {
        element.reference.update({'highlightChatMessage': false});
      }
      ChatUpdateAllHighLightMessageSuccess();
    } catch (e) {
      emit(ChatHighLightMessageFailure(errorMessage: e.toString()));
      debugPrint('error from update all high light method: ${e.toString()}');
    }
  }
}
