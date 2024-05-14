import 'package:cloud_firestore/cloud_firestore.dart';

class ImageModel {
  final String imageUrl, imageID, userID;
  final DateTime dateTime;
  final bool isProfileImage;
  final bool isStoryImage;

  ImageModel(
      {required this.imageUrl,
      required this.imageID,
      required this.userID,
      required this.dateTime,
      required this.isProfileImage,
      required this.isStoryImage});

  factory ImageModel.fromJson(jsonData) {
    return ImageModel(
        imageUrl: jsonData['imageUrl'],
        imageID: jsonData['imageID'],
        userID: jsonData['userID'],
        dateTime: (jsonData['dateTime'] as Timestamp).toDate(),
        isProfileImage: jsonData['isProfileImage'],
        isStoryImage: jsonData['isStoryImage']);
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'imageID': imageID,
      'userID': userID,
      'dateTime': dateTime,
      'isProfileImage': isProfileImage,
      'isStoryImage': isStoryImage
    };
  }
}
