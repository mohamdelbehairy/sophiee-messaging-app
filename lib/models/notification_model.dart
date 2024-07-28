import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String publishID, notificationType, notificationID;
  final bool? isLive;
  final DateTime dateTime;

  NotificationModel(
      {required this.publishID,
      required this.notificationType,
      required this.notificationID,
      this.isLive,
      required this.dateTime});

  factory NotificationModel.fromJson(jsonData) {
    return NotificationModel(
      publishID: jsonData['publishID'],
      notificationType: jsonData['notificationType'],
      notificationID: jsonData['notificationID'],
      isLive: jsonData['isLive'],
      dateTime: (jsonData['dateTime'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'publishID': publishID,
      'notificationType': notificationType,
      'notificationID': notificationID,
      'isLive': isLive,
      'dateTime': dateTime
    };
  }
}
