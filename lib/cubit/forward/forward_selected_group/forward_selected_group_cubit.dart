import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forward_selected_group_state.dart';

class ForwardSelectedGroupCubit extends Cubit<ForwardSelectedGroupState> {
  ForwardSelectedGroupCubit() : super(ForwardSelectedGroupInitial());

  Future<void> selectedGroup(
      {required String groupID,
      required String groupName
     }) async {
    emit(ForwardSelectedGroupLoading());
    try {
      await FirebaseFirestore.instance
          .collection('forwardGroup')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('forwardGroup')
          .doc(groupID)
          .set({
        'groupID': groupID,
        'groupName': groupName,
      
      });
      emit(ForwardSelectedGroupSuccess());
    } catch (e) {
      debugPrint('error from selected group method: ${e.toString()}');
    }
  }

  List<String> selectedGroupList = [];
  getSelectedGroup() {
    try {
      FirebaseFirestore.instance
          .collection('forwardGroup')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('forwardGroup')
          .snapshots()
          .listen((snapshot) {
        selectedGroupList = [];
        for (var selected in snapshot.docs) {
          selectedGroupList.add(selected.data()['groupID']);
        }
        emit(GetForwardSelectedGroupSuccess());
      });
    } catch (e) {
      debugPrint('error from get selected group: ${e.toString()}');
    }
  }

  Future<void> deleteSelectedGroups({required String groupID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('forwardGroup')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('forwardGroup')
          .doc(groupID)
          .delete();
      emit(DeleteForwardSelectedGroupSuccess());
    } catch (e) {
      debugPrint('error from delete selected group method: ${e.toString()}');
    }
  }

  Future<void> deleteAllSelectedGroups() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('forwardGroup')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('forwardGroup')
          .get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        await documentSnapshot.reference.delete();
      }

      emit(DeleteAllSelectedGroupSuccess());
    } catch (e) {
      debugPrint(
          'error from delete all selected groups method: ${e.toString()}');
    }
  }
}
