import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/story/story_state.dart';
import 'package:sophiee/models/story_model.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit() : super(AddStoryInitial());

  Future<void> addStory(
      {String? imageUrl,
      String? videoUrl,
      required String storyText,
      int? storyVideoTime}) async {
    try {
      StoryModel storyModel = StoryModel.fromJson({
        'storyImage': imageUrl,
        'storyVideo': videoUrl,
        'storyText': storyText,
        'storyDataTime': Timestamp.now(),
        'storyExpirationTime':
            Timestamp.fromDate(DateTime.now().add(const Duration(days: 1))),
        'storyVideoTime': storyVideoTime
      });
      await FirebaseFirestore.instance
          .collection('stories')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('stories')
          .add(storyModel.toMap());
      emit(AddStorySuccess());
    } catch (e) {
      emit(AddStoryFailure(errorMessage: e.toString()));
      debugPrint('error from add story: ${e.toString()}');
    }
  }

  Future<void> updateIsStory({required bool isStory}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'isStory': isStory});
  }

  Future<void> getStory({required String friendId}) async {
    try {
      await FirebaseFirestore.instance
          .collection('stories')
          .doc(friendId)
          .collection('stories')
          .orderBy('storyDataTime', descending: false)
          .get()
          .then((QuerySnapshot<Map<String, dynamic>> snapshot) {
        List<StoryModel> stories =
            snapshot.docs.map((e) => StoryModel.fromJson(e.data())).toList();
        if (stories.isNotEmpty) {
          emit(GetStorySuccess(stories: stories));
        }
      });
    } catch (e) {
      emit(GetStoryFailure(errorMessage: e.toString()));
      debugPrint('error from get story method: ${e.toString()}');
    }
  }

  Future<bool> checkIsStory(
      {required String friendId, required String story}) async {
    var userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(friendId)
        .get();
    if (userData.exists) {
      Map<String, dynamic> userField = userData.data() as Map<String, dynamic>;
      bool isStory = userField[story];
      return isStory;
    }
    return false;
  }

  void startDeleteStory() {
    const Duration period = Duration(seconds: 1);
    Timer.periodic(period, (timer) {
      deleteStory();
    });
  }

  Future<void> deleteStory() async {
    try {
      var documents = await FirebaseFirestore.instance
          .collection('stories')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('stories')
          .get();
      if (documents.docs.isEmpty) {
        updateIsStory(isStory: false);
      }
      DateTime currentDateTime = DateTime.now();
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('stories')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('stories')
          .get();
      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in snapshot.docs) {
        DateTime expirationTime =
            document.data()['storyExpirationTime'].toDate();
        if (currentDateTime.isAfter(expirationTime)) {
          await document.reference.delete();
          debugPrint('اتحذفت');
        }
      }
    } catch (e) {
      debugPrint('error from deleteExpiredStories method: ${e.toString()}');
    }
  }
}
