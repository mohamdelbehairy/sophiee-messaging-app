import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../user_date/user_token/user_token_cubit.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit() : super(DeleteAccountInitial());

  Future<void> deleteFollowersAndFollowing() async {
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
    } catch (e) {
      emit(DeleteAccountFailure(errorMessage: e.toString()));
      debugPrint('error from delete followers and following method: $e');
    }
  }

  Future<void> deleteAllFriends() async {
    var document = await FirebaseFirestore.instance
        .collection('friends')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('friends')
        .get();
    for (var snapshot in document.docs) {
      await FirebaseFirestore.instance
          .collection('friends')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('friends')
          .doc(snapshot.id)
          .delete();
      await FirebaseFirestore.instance
          .collection('friends')
          .doc(snapshot.id)
          .collection('friends')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .delete();
    }
  }

  Future<void> deleteAllImages() async {
    var document = await FirebaseFirestore.instance
        .collection('images')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Images')
        .get();

    for (var snapshot in document.docs) {
      await snapshot.reference.delete();
    }
  }

  Future<void> deleteAllNotification() async {
    var document = await FirebaseFirestore.instance
        .collection('notification')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('notification')
        .get();
    for (var snapshot in document.docs) {
      await snapshot.reference.delete();
    }
  }

  Future<void> deleteRecentSearch() async {
    var document = await FirebaseFirestore.instance
        .collection('recentSearch')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('recentSearch')
        .get();
    for (var snapshot in document.docs) {
      await snapshot.reference.delete();
    }
  }

  Future<void> deleteAllGroup() async {
    var document = await FirebaseFirestore.instance.collection('groups').get();
    for (var snapshot in document.docs) {
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(snapshot.id)
          .update({
        'usersID':
            FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid]),
        'adminsID':
            FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid])
      });
    }
  }

  Future<void> deleteAllChat() async {
    var document = await FirebaseFirestore.instance
        .collection('chats')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('users')
        .get();

    for (var snapshot in document.docs) {
      await FirebaseFirestore.instance
          .collection('chats')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('users')
          .doc(snapshot.id)
          .delete();
    }
    var chatDocument = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('chats')
        .get();
    for (var snapshot in chatDocument.docs) {
      await snapshot.reference.delete();
    }
  }

  Future<void> deleteAllStories() async {
    var document = await FirebaseFirestore.instance
        .collection('stories')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('stories')
        .get();

    for (var snapshot in document.docs) {
      await snapshot.reference.delete();
    }
  }

  Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('storeUser', FirebaseAuth.instance.currentUser!.uid);
    var user = FirebaseAuth.instance.currentUser;
    await user?.delete();
  }

  Future<void> deleteUserInfo({required String? userID}) async {
    await FirebaseFirestore.instance.collection('users').doc(userID).delete();
  }

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());
    try {
      UserTokenCubit removeToken = UserTokenCubit();
      await deleteFollowersAndFollowing();
      await deleteAllFriends();
      await deleteAllImages();
      await deleteAllNotification();
      await deleteRecentSearch();
      await deleteAllGroup();
      await deleteAllChat();
      await deleteAllStories();
      await removeToken.updateUserToken(token: '');
      await deleteUser();
      emit(DeleteAccountSuccess());
    } catch (e) {
      emit(DeleteAccountFailure(errorMessage: e.toString()));
      debugPrint('error from delete account method: $e');
    }
  }
}
