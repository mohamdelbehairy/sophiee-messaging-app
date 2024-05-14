import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/story/story_state.dart';
import 'package:sophiee/models/story_model.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_alert_dialog.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit() : super(AddStoryInitial());

  Future<void> addStory(
      {String? imageUrl,
      File? video,
      required BuildContext context,
      required String storyText}) async {
    try {
      // String? imageUrl;
      String? videoUrl;
      // if (image != null) {
      //   imageUrl = await uploadStoryImage(imageFile: image, context: context);
      // } else
      if (video != null) {
        videoUrl = await uploadStoryVideo(videoFile: video, context: context);
      }
      StoryModel storyModel = StoryModel.fromJson({
        'storyImage': imageUrl,
        'storyVideo': videoUrl,
        'storyText': storyText,
        'storyDataTime': Timestamp.now(),
        'storyExpirationTime':
            Timestamp.fromDate(DateTime.now().add(const Duration(days: 1))),
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

  Future<String?> uploadStoryVideo(
      {required File videoFile, required BuildContext context}) async {
    try {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AddStoryAlertDialog();
          });
      String videoName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference =
          FirebaseStorage.instance.ref().child('stories_videos/$videoName');
      await reference.putFile(videoFile);
      String videoUrl = await reference.getDownloadURL();
      emit(UploadStoryVideoSuccess());
      debugPrint('videoUrl: $videoUrl');
      return videoUrl;
    } catch (e) {
      emit(UploadStoryVideoFailure(errorMessage: e.toString()));
      debugPrint('error from upload story image: ${e.toString()}');
      return '';
    }
  }

  Future<String> uploadStoryImage(
      {required File imageFile, required BuildContext context}) async {
    try {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AddStoryAlertDialog();
          });
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference =
          FirebaseStorage.instance.ref().child('stories_images/$imageName');
      await reference.putFile(imageFile);
      String imageUrl = await reference.getDownloadURL();
      emit(UploadStoryImageSuccess());
      return imageUrl;
    } catch (e) {
      emit(UploadStoryImageFailure(errorMessage: e.toString()));
      debugPrint('error from upload story image: ${e.toString()}');
      return '';
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

  Future<bool> checkIsStory({required String friendId}) async {
    var userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(friendId)
        .get();
    if (userData.exists) {
      Map<String, dynamic> userField = userData.data() as Map<String, dynamic>;
      bool isStory = userField['isStory'];
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
