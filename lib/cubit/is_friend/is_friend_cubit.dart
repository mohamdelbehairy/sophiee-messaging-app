import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'is_friend_state.dart';

class IsFriendCubit extends Cubit<IsFriendState> {
  IsFriendCubit() : super(IsFriendInitial());

  List<String> friends = [];
  void isFriend() {
    emit(IsFriendLoading());
    try {
      FirebaseFirestore.instance
          .collection('friends')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('friends')
          .snapshots()
          .listen((snapshot) {
        if (snapshot.docChanges.isNotEmpty) {
          friends = snapshot.docChanges.map((doc) => doc.doc.id).toList();
          emit(IsFriendSuccess());
        }
      });
    } catch (e) {
      emit(IsFriendFailure(errorMessage: e.toString()));
      debugPrint('error from is friend method: $e');
    }
  }
}
