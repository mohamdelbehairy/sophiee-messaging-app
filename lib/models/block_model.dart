import 'package:cloud_firestore/cloud_firestore.dart';

class BlockModel {
  final String userID;
  final DateTime dateTime;

  BlockModel({required this.userID, required this.dateTime});

  factory BlockModel.fromJson(jsonData) {
    return BlockModel(
      userID: jsonData['userID'],
      dateTime: (jsonData['dateTime'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'dateTime': dateTime,
    };
  }
}
