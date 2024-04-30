import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/forward/forward_selected_friend/forward_selected_friend_state.dart';
import 'package:sophiee/models/users_model.dart';

class ForwardSelectedFriendCubit extends Cubit<ForwardSelectedFriendState> {
  ForwardSelectedFriendCubit() : super(ForwardSelectedFriendInitial());

  Future<void> selectedFriend(
      {required String selectedFriendID,
      required String userName,
      required String profileImage,
      required String userID}) async {
    emit(ForwardSelectedFriendLoading());
    try {
      await FirebaseFirestore.instance
          .collection('selectedFriend')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('selectedFriend')
          .doc(selectedFriendID)
          .set({
        'userName': userName,
        'profileImage': profileImage,
        'userID': userID,
      });
      emit(ForwardSelectedFriendSuccess());
    } catch (e) {
      debugPrint('error from selected friend method: ${e.toString()}');
    }
  }

  List<UserModel> selectedFriendList = [];
  getSelectedFriend() {
    try {
      FirebaseFirestore.instance
          .collection('selectedFriend')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('selectedFriend')
          .snapshots()
          .listen((snapshot) {
        selectedFriendList = [];
        for (var selected in snapshot.docs) {
          selectedFriendList.add(UserModel.fromJson(selected.data()));
        }
        emit(GetForwardSelectedFriendSuccess());
      });
    } catch (e) {
      debugPrint('error from get selected friend: ${e.toString()}');
    }
  }

  Future<void> deleteSelectedFriend({required String selectedFriendID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('selectedFriend')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('selectedFriend')
          .doc(selectedFriendID)
          .delete();
      emit(DeleteForwardSelectedFriendSuccess());
    } catch (e) {
      debugPrint('error from delete selected friend method: ${e.toString()}');
    }
  }

  Future<void> deleteAllSelectedFriends() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('selectedFriend')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('selectedFriend')
          .get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        await documentSnapshot.reference.delete();
      }

      emit(DeleteAllSelectedFriendsSuccess());
    } catch (e) {
      debugPrint(
          'error from delete all selected friends method: ${e.toString()}');
    }
  }
}
