import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'group_permissions_state.dart';

class GroupPermissionsCubit extends Cubit<GroupPermissionsState> {
  GroupPermissionsCubit() : super(GroupPermissionsInitial());

  Future<void> updateGroupPermission(
      {required String groupID,
      required String fieldName,
      required bool fieldValue}) async {
    emit(GroupPermissionsUpdatedLoading());
    try {
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .update({fieldName: fieldValue});
      emit(GroupPermissionsUpdatedSuccess());
    } catch (e) {
      emit(GroupPermissionsUpdatedFailure(errorMessage: e.toString()));
      debugPrint('error from update manage group: ${e.toString()}');
    }
  }
}
