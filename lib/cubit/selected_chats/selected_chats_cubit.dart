import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/selected_chats/selected_chats_state.dart';
import 'package:sophiee/models/users_model.dart';

class SelectedChatsCubit extends Cubit<SelectedChatsState> {
  SelectedChatsCubit() : super(SelectedChatsInitial());

  Future<void> selectedChats(
      {required friendChatID,
      required String userName,
      required String profileImage,
      required String userID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('selectedChats')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('selectedChats')
          .doc(friendChatID)
          .set({
        'userName': userName,
        'profileImage': profileImage,
        'userID': userID,
      });
      emit(SelectedChatsSuccess());
    } catch (e) {
      debugPrint('error from selected chats method: ${e.toString()}');
    }
  }

  List<UserModel> selectedChatsList = [];
  void getSelectedChats() {
    try {
      FirebaseFirestore.instance
          .collection('selectedChats')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('selectedChats')
          .snapshots()
          .listen((snapshot) {
        selectedChatsList = [];
        for (var chats in snapshot.docs) {
          selectedChatsList.add(UserModel.fromJson(chats.data()));
        }
        debugPrint('selectedChatsList:${selectedChatsList.length}');
        emit(GetSelectedChatsSuccess());
      });
    } catch (e) {
      debugPrint('error from get selected chats method: ${e.toString()}');
    }
  }
}
