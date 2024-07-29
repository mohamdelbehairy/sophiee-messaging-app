import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit() : super(DeleteAccountInitial());

  Future<void> deleteFollowersAndFollowing() async {
    emit(DeleteAccountLoading());
    try {
      var followingDoucment = await FirebaseFirestore.instance
          .collection('following')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('following')
          .get();

      var followerDoucment = await FirebaseFirestore.instance
          .collection('followers')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('followers')
          .get();

      for (var snapshot in followingDoucment.docs) {
        await FirebaseFirestore.instance
            .collection('following')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('following')
            .doc(snapshot.id)
            .delete();
        await FirebaseFirestore.instance
            .collection('followers')
            .doc(snapshot.id)
            .collection('followers')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .delete();
      }

      for (var snapshot in followerDoucment.docs) {
        await FirebaseFirestore.instance
            .collection('followers')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('followers')
            .doc(snapshot.id)
            .delete();
        await FirebaseFirestore.instance
            .collection('following')
            .doc(snapshot.id)
            .collection('following')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .delete();
      }
      emit(DeleteFollowersAndFollowing());
    } catch (e) {
      emit(DeleteAccountFailure(errorMessage: e.toString()));
      debugPrint('error from delete followers and following method: $e');
    }
  }
}
