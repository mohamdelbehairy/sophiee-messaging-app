import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MediaFilesModel {
  final String messageID;
  final String senderID;
  final DateTime dateTime;
  String? messageImage;
  String? messageVideo;
  String? messageText;
  String? messageFile;
  String? messageFileName;
  double? messageFileSize;
  String? messageFileType;
  String? messageLink;
  String? messageRecord;
  String? messageSound;
  String? messageSoundName;

  MediaFilesModel(
      {required this.messageID,
      required this.senderID,
      required this.dateTime,
      this.messageImage,
      this.messageVideo,
      this.messageText,
      this.messageFile,
      this.messageFileName,
      this.messageFileSize,
      this.messageFileType,
      this.messageLink,
      this.messageRecord,
      this.messageSound,
      this.messageSoundName});

  factory MediaFilesModel.fromJson(jsonData) {
    return MediaFilesModel(
        messageID: jsonData['messageID'],
        senderID: jsonData['senderID'],
        dateTime: (jsonData['dateTime'] as Timestamp).toDate(),
        messageImage: jsonData['messageImage'],
        messageVideo: jsonData['messageVideo'],
        messageText: jsonData['messageText'],
        messageFile: jsonData['messageFile'],
        messageFileName: jsonData['messageFileName'],
        messageFileSize: jsonData['messageFileSize'],
        messageFileType: jsonData['messageFileType'],
        messageLink: jsonData['messageLink'],
        messageRecord: jsonData['messageRecord'],
        messageSound: jsonData['messageSound'],
        messageSoundName: jsonData['messageSoundName']);
  }

  Map<String, dynamic> toMap() {
    return {
      'messageID': messageID,
      'senderID': senderID,
      'dateTime': dateTime,
      'messageImage': messageImage,
      'messageVideo': messageVideo,
      'messageText': messageText,
      'messageFile': messageFile,
      'messageFileName': messageFileName,
      'messageFileSize': messageFileSize,
      'messageFileType': messageFileType,
      'messageLink': messageLink,
      'messageRecord': messageRecord,
      'messageSound': messageSound,
      'messageSoundName': messageSoundName
    };
  }

  String showMediaTime() {
    return DateFormat('dd/MM/yy, HH:mm').format(dateTime);
  }

  String showTime() {
    return DateFormat('dd/MM/yy').format(dateTime);
  }

  String showVoiceDate() {
    return DateFormat('MMM dd').format(dateTime);
  }

  String showVoiceTime() {
    return DateFormat('HH:mm').format(dateTime);
  }
}
