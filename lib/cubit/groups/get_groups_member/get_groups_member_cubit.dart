import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/groups/get_groups_member/get_groups_member_state.dart';
import 'package:sophiee/models/group_model.dart';

class GetGroupsMemberCubit extends Cubit<GetGroupsMemberState> {
  GetGroupsMemberCubit() : super(GetGroupsMemberInitial());

  void getGroupsMember() {
    emit(GetGroupsMemberLoading());
    try {
      FirebaseFirestore.instance
          .collection('groups')
          .snapshots()
          .listen((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          List<GroupModel> groupsList =
              snapshot.docs.map((e) => GroupModel.fromJson(e.data())).toList();

          if (groupsList.isNotEmpty) {
            emit(GetGroupsMemberSuccess(groupsList: groupsList));
          }
        }
      });
    } catch (e) {
      emit(GetGroupsMemberFailure(errorMessage: e.toString()));
      debugPrint('error from get groups memeber cubit: ${e.toString()}');
    }
  }
}
