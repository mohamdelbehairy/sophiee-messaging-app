import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_state.dart';

class GroupsMemberSelectedCubit extends Cubit<GroupsMemberSelectedState> {
  GroupsMemberSelectedCubit() : super(GroupsMemberSelectedInitial());

  Future<void> groupsMemberSelected(
      {required String selectedFriendID,
      required String userName,
      required String profileImage,
      required String userID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('groupsMemberSelectedFriends')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('groupsMemberSelectedFriends')
          .doc(selectedFriendID)
          .set({
        'userID': userID,
        
      });
      emit(GroupsMemberSelectedSuccess());
    } catch (e) {
      debugPrint('error from selected friends method');
    }
  }

  Future<void> deleteGroupsMemberSelectedFriends(
      {required String selectedFriendID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('groupsMemberSelectedFriends')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('groupsMemberSelectedFriends')
          .doc(selectedFriendID)
          .delete();
      emit(DeleteGroupsMemberSelectedSuccess());
    } catch (e) {
      debugPrint('error from delete selected friends method');
    }
  }

  List<String> getGroupsMemberSelectedFriendsList = [];
  void getGroupsMemberSelectedFriends() {
    try {
      FirebaseFirestore.instance
          .collection('groupsMemberSelectedFriends')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('groupsMemberSelectedFriends')
          .snapshots()
          .listen((snapshot) {
        getGroupsMemberSelectedFriendsList = [];
        for (var selected in snapshot.docs) {
          getGroupsMemberSelectedFriendsList.add(selected.data()['userID']);
        }

        emit(GetGroupsMemberSelectedSuccess());
      });
    } catch (e) {
      debugPrint('error from get selected friend: ${e.toString()}');
    }
  }
}
