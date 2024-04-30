import 'package:cloud_firestore/cloud_firestore.dart';

class StoryModel {
  String? storyImage;
  String? storyVideo;
  final String storyText;
  final DateTime storyDataTime;
  final DateTime storyExpirationTime;

  StoryModel({
    this.storyImage,
    this.storyVideo,
    required this.storyText,
    required this.storyDataTime,
    required this.storyExpirationTime,
  });

  factory StoryModel.fromJson(jsonData) {
    return StoryModel(
        storyImage: jsonData['storyImage'],
        storyVideo: jsonData['storyVideo'],
        storyText: jsonData['storyText'],
        storyDataTime: (jsonData['storyDataTime'] as Timestamp).toDate(),
        storyExpirationTime:
            (jsonData['storyExpirationTime'] as Timestamp).toDate());
  }

  Map<String, dynamic> toMap() {
    return {
      'storyImage': storyImage,
      'storyVideo': storyVideo,
      'storyText': storyText,
      'storyDataTime': storyDataTime,
      'storyExpirationTime': storyExpirationTime,
    };
  }
}
