import 'package:cloud_firestore/cloud_firestore.dart';

class RecentSearchModel {
  final String userID;
  final DateTime dateTime;

  RecentSearchModel({required this.userID, required this.dateTime});

  factory RecentSearchModel.fromJson(jsonData) {
    return RecentSearchModel(
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
