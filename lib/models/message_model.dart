import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MessageModel {
  final String senderID;
  final String receiverID;
  final String messageID;
  final String messageText;
  final DateTime messageDateTime;
  final bool isSeen;
  final String? messageImage;
  final String? messageFile;
  final String? messageFileName;
  final String? messageSound;
  final String? messageSoundName;
  final String? messageSoundTime;
  final String? messageRecord;
  final String? messageRecordTime;
  final bool? messageSoundPlaying;
  final String? phoneContactNumber;
  final String? phoneContactName;
  final String? messageVideo;
  List<dynamic> groupChatUsersIDSeen;
  String? replayTextMessage;
  String? replayImageMessage;
  String? replayFileMessage;
  String? replayContactMessage;
  String? friendNameReplay;
  String? replayMessageID;
  String? replaySoundMessage;
  String? replayRecordMessage;
  List<dynamic>? highlightMessage;
  bool? highlightChatMessage;

  MessageModel(
      {required this.senderID,
      required this.receiverID,
      required this.messageID,
      required this.messageText,
      required this.messageDateTime,
      required this.isSeen,
      this.messageImage,
      this.messageFile,
      this.messageFileName,
      this.messageSound,
      this.messageSoundName,
      this.messageSoundTime,
      this.messageRecord,
      this.messageRecordTime,
      this.messageSoundPlaying,
      this.phoneContactNumber,
      this.phoneContactName,
      this.messageVideo,
      this.groupChatUsersIDSeen = const [],
      this.replayTextMessage,
      this.replayImageMessage,
      this.replayFileMessage,
      this.replayContactMessage,
      this.friendNameReplay,
      this.replayMessageID,
      this.replaySoundMessage,
      this.replayRecordMessage,
      this.highlightMessage,
      this.highlightChatMessage});

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
        senderID: jsonData['senderID'],
        receiverID: jsonData['receiverID'],
        messageID: jsonData['messageID'],
        messageText: jsonData['messageText'],
        messageDateTime: (jsonData['messageDateTime'] as Timestamp).toDate(),
        isSeen: jsonData['isSeen'],
        messageImage: jsonData['messageImage'],
        messageFile: jsonData['messageFile'],
        messageFileName: jsonData['messageFileName'],
        messageSound: jsonData['messageSound'],
        messageSoundName: jsonData['messageSoundName'],
        messageSoundTime: jsonData['messageSoundTime'],
        messageRecord: jsonData['messageRecord'],
        messageRecordTime: jsonData['messageRecordTime'],
        messageSoundPlaying: jsonData['messageSoundPlaying'],
        phoneContactNumber: jsonData['phoneContactNumber'],
        phoneContactName: jsonData['phoneContactName'],
        messageVideo: jsonData['messageVideo'],
        groupChatUsersIDSeen: jsonData['groupChatUsersIDSeen'],
        replayTextMessage: jsonData['replayTextMessage'],
        replayImageMessage: jsonData['replayImageMessage'],
        replayFileMessage: jsonData['replayFileMessage'],
        replayContactMessage: jsonData['replayContactMessage'],
        friendNameReplay: jsonData['friendNameReplay'],
        replayMessageID: jsonData['replayMessageID'],
        replaySoundMessage: jsonData['replaySoundMessage'],
        replayRecordMessage: jsonData['replayRecordMessage'],
        highlightMessage: jsonData['highlightMessage'],
        highlightChatMessage: jsonData['highlightChatMessage']);
  }

  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'receiverID': receiverID,
      'messageID': messageID,
      'messageText': messageText,
      'messageDateTime': messageDateTime,
      'isSeen': isSeen,
      'messageImage': messageImage,
      'messageFile': messageFile,
      'messageFileName': messageFileName,
      'messageSound': messageSound,
      'messageSoundName': messageSoundName,
      'messageSoundPlaying': messageSoundPlaying,
      'messageSoundTime': messageSoundTime,
      'messageRecord': messageRecord,
      'messageRecordTime': messageRecordTime,
      'phoneContactNumber': phoneContactNumber,
      'phoneContactName': phoneContactName,
      'messageVideo': messageVideo,
      'groupChatUsersIDSeen': groupChatUsersIDSeen,
      'replayTextMessage': replayTextMessage,
      'replayImageMessage': replayImageMessage,
      'replayFileMessage': replayFileMessage,
      'replayContactMessage': replayContactMessage,
      'friendNameReplay': friendNameReplay,
      'replayMessageID': replayMessageID,
      'replaySoundMessage': replaySoundMessage,
      'replayRecordMessage': replayRecordMessage,
      'highlightMessage': highlightMessage,
      'highlightChatMessage': highlightChatMessage
    };
  }

  String formattedTime() {
    return DateFormat('HH:mm ').format(messageDateTime);
  }

  String showChatImageTime() {
    return DateFormat('dd/MM/yy, HH:mm').format(messageDateTime);
  }

  String showHighLightTime() {
    return DateFormat('dd/MM/yy').format(messageDateTime);
  }
}
