import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'groups_members_details_state.dart';

class GroupsMembersDetailsCubit extends Cubit<GroupsMembersDetailsState> {
  GroupsMembersDetailsCubit() : super(GroupsMembersDetailsInitial());

  Future<void> removeGroupMember(
      {required String groupID, required String memberID}) async {
    emit(RemoveMemebrLoading());
    try {
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .update({
        'usersID': FieldValue.arrayRemove([memberID])
      });
      emit(RemoveMemberSuccess());
    } catch (e) {
      debugPrint('error from remove group member method: ${e.toString()}');
      emit(RemoveMemberFailure(errorMessage: e.toString()));
    }
  }

  Future<void> addGroupMember(
      {required String groupID, required List<String> memberID}) async {
    emit(AddMemebrLoading());
    try {
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .update({'usersID': FieldValue.arrayUnion(memberID)});
      emit(AddMemberSuccess());
    } catch (e) {
      debugPrint('error from add group member method: ${e.toString()}');
      emit(AddMemberFailure(errorMessage: e.toString()));
    }
  }

  Future<void> makeAdmin(
      {required String groupID, required String memberID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .update({
        'adminsID': FieldValue.arrayUnion([memberID])
      });
      emit(MakeAdminSuccess());
    } catch (e) {
      emit(MakeAdminFailure(errorMessage: e.toString()));
      debugPrint('error from make admin method: ${e.toString()}');
    }
  }

  Future<void> removeAdmin(
      {required String groupID, required String memberID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .update({
        'adminsID': FieldValue.arrayRemove([memberID])
      });
      emit(RemoveAdminSuccess());
    } catch (e) {
      emit(RemoveAdminFailure(errorMessage: e.toString()));
      debugPrint('error from make admin method: ${e.toString()}');
    }
  }
}
