import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/get_following/get_following_state.dart';
import 'package:sophiee/models/users_model.dart';

class GetFollowingCubit extends Cubit<GetFollowingState> {
  GetFollowingCubit() : super(GetFollowingInitial());

  List<UserModel> followingList = [];
  void getFollowing({required String userID}) {
    emit(GetFollowingLoading());
    try {
      FirebaseFirestore.instance
          .collection('followers')
          .doc(userID)
          .collection('followers')
          .snapshots()
          .listen((snapshot) {
        followingList = [];
        for (var element in snapshot.docs) {
          followingList.add(UserModel.fromJson(element.data()));
        }
        emit(GetFollowingSuccess());
        // if (snapshot.docs.isNotEmpty) {
        //   followingList =
        //       snapshot.docs.map((e) => UserModel.fromJson(e.data())).toList();
        //   if (followingList.isNotEmpty) {
        //     int numberOfFollowing = followingList.length;
        //     emit(GetFollowingSuccess(numberOfFollowing: numberOfFollowing));
        //   }
        // }
      });
    } catch (e) {
      emit(GetFollowingFailure(errorMessage: e.toString()));
      debugPrint('error from get follow result cubit: ${e.toString()}');
    }
  }
}
