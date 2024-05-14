import 'package:cloud_firestore/cloud_firestore.dart';

class ImageModel {
  final String imageUrl, imageID, userID;
  final DateTime dateTime;

  ImageModel(
      {required this.imageUrl,
      required this.imageID,
      required this.userID,
      required this.dateTime});

  factory ImageModel.fromJson(jsonData) {
    return ImageModel(
      imageUrl: jsonData['imageUrl'],
      imageID: jsonData['imageID'],
      userID: jsonData['userID'],
      dateTime: (jsonData['dateTime'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'imageID': imageID,
      'userID': userID,
      'dateTime': dateTime
    };
  }
}
