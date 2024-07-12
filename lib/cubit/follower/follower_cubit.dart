import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/follower/follower_state.dart';

class FollowerCubit extends Cubit<FollowerState> {
  FollowerCubit() : super(AddFollowerInitial());

  void addFollower({
    required String followerID,
    required String userName,
    required String profileImage,
    required String userID,
    required String emailAddress,
    required bool isFollowing,
    required String meUserName,
    required String meProfileImage,
    required String meEmailAddress,
  }) async {
    emit(AddFollowerLoading());
    try {
      await FirebaseFirestore.instance
          .collection('followers')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('followers')
          .doc(followerID)
          .set({
        'userName': userName,
        'profileImage': profileImage,
        'userID': userID,
        'emailAddress': emailAddress,
        'isFollowing': isFollowing,
      });

      await FirebaseFirestore.instance
          .collection('following')
          .doc(followerID)
          .collection('following')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'userName': meUserName,
        'profileImage': meProfileImage,
        'userID': FirebaseAuth.instance.currentUser!.uid,
        'emailAddress': meEmailAddress,
      });
      emit(AddFollowerSuccess(isFollowing: isFollowing));
    } catch (e) {
      emit(AddFollowerFailure(errorMessage: e.toString()));
      debugPrint('error from add follower cubit: ${e.toString()}');
    }
  }

  Future<void> deleteFollower({required String followerID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('followers')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('followers')
          .doc(followerID)
          .delete();
      await FirebaseFirestore.instance
          .collection('following')
          .doc(followerID)
          .collection('following')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .delete();
      var newIsFollowing = false;
      emit(DeleteFollowerSuccess(isFollowing: newIsFollowing));
    } catch (e) {
      debugPrint('error from delete follower method: ${e.toString()}');
    }
  }

  Future<bool> followerResult({required String followerID}) async {
    var documentSnapshot = await FirebaseFirestore.instance
        .collection('followers')
        .doc(followerID)
        .collection('followers')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (documentSnapshot.exists) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> deleteAllFollowerInfo({required String followerID}) async {
    await FirebaseFirestore.instance
        .collection('followers')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('followers')
        .doc(followerID)
        .delete();
    await FirebaseFirestore.instance
        .collection('following')
        .doc(followerID)
        .collection('following')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .delete();

    await FirebaseFirestore.instance
        .collection('followers')
        .doc(followerID)
        .collection('followers')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .delete();
    await FirebaseFirestore.instance
        .collection('following')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('following')
        .doc(followerID)
        .delete();
    emit(BlocAllFollowerInfoSuccess());
  }
}
