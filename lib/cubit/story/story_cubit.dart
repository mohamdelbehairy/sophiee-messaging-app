import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/story/story_state.dart';
import 'package:sophiee/models/story_model.dart';

import '../../constants.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit() : super(AddStoryInitial());

  Future<void> addStory(
      {String? imageUrl,
      String? videoUrl,
      required String storyText,
      int? storyVideoTime}) async {
    try {
      StoryModel storyModel = StoryModel.fromJson({
        storyImageField: imageUrl,
        storyVideoField: videoUrl,
        storyTextField: storyText,
        storyDataTimeField: Timestamp.now(),
        storyExpirationTimeField:
            Timestamp.fromDate(DateTime.now().add(const Duration(days: 1))),
        storyVideoTimeField: storyVideoTime
      });
      await FirebaseFirestore.instance
          .collection(storiesCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(storiesCollection)
          .add(storyModel.toMap());
      emit(AddStorySuccess());
    } catch (e) {
      emit(AddStoryFailure(errorMessage: e.toString()));
      debugPrint('error from add story: $e');
    }
  }

  Future<void> updateIsStory(
      {required bool isStory, required String userID}) async {
    await FirebaseFirestore.instance
        .collection(userCollection)
        .doc(userID)
        .update({'isStory': isStory});
  }

  void getStory({required String friendId}) {
    try {
      FirebaseFirestore.instance
          .collection(storiesCollection)
          .doc(friendId)
          .collection(storiesCollection)
          .orderBy('storyDataTime', descending: false)
          .snapshots()
          .listen((snapshot) {
        List<StoryModel> stories =
            snapshot.docs.map((e) => StoryModel.fromJson(e.data())).toList();
        if (stories.isNotEmpty) {
          emit(GetStorySuccess(stories: stories));
        }
      });
    } catch (e) {
      emit(GetStoryFailure(errorMessage: e.toString()));
      debugPrint('error from get story method: $e');
    }
  }

  Future<bool> checkIsStory(
      {required String friendId, required String story}) async {
    var userData = await FirebaseFirestore.instance
        .collection(userCollection)
        .doc(friendId)
        .get();
    if (userData.exists) {
      Map<String, dynamic> userField = userData.data() as Map<String, dynamic>;
      bool isStory = userField[story];
      return isStory;
    }
    return false;
  }

  Future<void> deleteStory({required String userID}) async {
    try {
      DateTime currentDateTime = DateTime.now();
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection(storiesCollection)
          .doc(userID)
          .collection(storiesCollection)
          .get();
      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in snapshot.docs) {
        DateTime expirationTime =
            document.data()['storyExpirationTime'].toDate();
        if (currentDateTime.isAfter(expirationTime)) {
          await document.reference.delete();
          log('اتحذفت');
        } else {
          log('لسه فيه وقت لحذفها');
          log('date time now: $currentDateTime');
          log('date time expiration: $expirationTime');
        }
        await isAllStoryDeleted(userID: userID);
      }
    } catch (e) {
      debugPrint('error from deleteExpiredStories method: $e');
    }
  }

  Future<void> isAllStoryDeleted({required String userID}) async {
    var documents = await FirebaseFirestore.instance
        .collection(storiesCollection)
        .doc(userID)
        .collection(storiesCollection)
        .get();
    if (documents.docs.isEmpty) {
      updateIsStory(isStory: false, userID: userID);
    }
  }
}
