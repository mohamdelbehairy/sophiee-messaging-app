import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowStatusCubit extends Cubit<bool> {
  FollowStatusCubit() : super(false);

  void checkFollowStatus({required String followerID}) {
    try {
      FirebaseFirestore.instance
          .collection('followers')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('followers')
          .doc(followerID)
          .snapshots()
          .listen((event) {
        bool isFollowing = false;
        if (event.exists) {
          isFollowing = event.data()!['isFollowing'] ?? false;
        }
        emit(isFollowing);
      });
    } catch (e) {
      debugPrint('error from follow status cubit: ${e.toString()}');
    }
  }
}
