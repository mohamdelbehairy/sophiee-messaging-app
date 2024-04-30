import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/chats/chats_state.dart';
import 'package:sophiee/models/users_model.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(ChatsInitial());

  List<UserModel> chatsList = [];
  void chats()  {
    emit(ChatsLoading());

    try {
      FirebaseFirestore.instance
          .collection('chats')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('users')
          .orderBy('lastMessage.lastMessageDateTime', descending: true)
          .snapshots()
          .listen((snapshot) {
        chatsList = [];
        for (var chat in snapshot.docs) {
          chatsList.add(UserModel.fromJson(chat.data()));
        }
        emit(ChatsSuccess());
      });
    } catch (e) {
      emit(ChatsFailure(errorMessage: e.toString()));
      debugPrint('error from chats cubit: ${e.toString()}');
    }
  }
}
