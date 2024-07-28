import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String publishID, notificationType, notificationID;
  final bool? isLive;
  final bool isRead;
  final DateTime dateTime;

  NotificationModel(
      {required this.publishID,
      required this.notificationType,
      required this.notificationID,
      this.isLive,
      required this.isRead,
      required this.dateTime});

  factory NotificationModel.fromJson(jsonData) {
    return NotificationModel(
      publishID: jsonData['publishID'],
      notificationType: jsonData['notificationType'],
      notificationID: jsonData['notificationID'],
      isLive: jsonData['isLive'],
      isRead: jsonData['isRead'],
      dateTime: (jsonData['dateTime'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'publishID': publishID,
      'notificationType': notificationType,
      'notificationID': notificationID,
      'isLive': isLive,
      'isRead': isRead,
      'dateTime': dateTime
    };
  }
}
