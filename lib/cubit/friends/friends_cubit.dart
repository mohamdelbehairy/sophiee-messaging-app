import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/friends/friends_state.dart';

class FriendsCubit extends Cubit<FriendsState> {
  FriendsCubit() : super(SetFriendsInitial());

  void setFriends({
    required String friendID,
    required String userName,
    required String profileImage,
    required String userID,
    required String emailAddress,
    required String meUserName,
    required String meProfileImage,
    required String meEmailAddress,
  }) async {
    emit(SetFriendsLoading());
    try {
      await FirebaseFirestore.instance
          .collection('friends')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('friends')
          .doc(friendID)
          .set({
        'userName': userName,
        'profileImage': profileImage,
        'userID': userID,
        'emailAddress': emailAddress,
        'isFriends': true,
      });

      await FirebaseFirestore.instance
          .collection('friends')
          .doc(friendID)
          .collection('friends')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'userName': meUserName,
        'profileImage': meProfileImage,
        'userID': FirebaseAuth.instance.currentUser!.uid,
        'emailAddress': meEmailAddress,
        'isFriends': true,
      });
      emit(SetFriendsSuccess());
    } catch (e) {
      emit(SetFriendsFailure(errorMessage: e.toString()));
      debugPrint('error from friends cubit: ${e.toString()}');
    }
  }

  void deleteFriends({required String friendID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('friends')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('friends')
          .doc(friendID)
          .delete();

      await FirebaseFirestore.instance
          .collection('friends')
          .doc(friendID)
          .collection('friends')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .delete();
      emit(DeleteFriendsSuccess());
    } catch (e) {
      debugPrint('error from delete method friends: ${e.toString()}');
    }
  }
}
