import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class GroupModel {
  final String groupID;
  final String groupName;
  final String groupDescription;
  String? groupImage;
  final String groupOwnerID;
  List<String> usersID;
  List<String> adminsID;
  final DateTime groupCreateAt;
  final bool isMemberSettings;
  final bool isSendMessages;
  final bool isDeleteMessage;
  final bool isRemoveMember;
  final bool isAddFriends;

  GroupModel(
      {required this.groupID,
      required this.groupName,
      required this.groupDescription,
      this.groupImage,
      required this.groupOwnerID,
      this.usersID = const [],
      this.adminsID = const [],
      required this.groupCreateAt,
      required this.isMemberSettings,
      required this.isSendMessages,
      required this.isDeleteMessage,
      required this.isRemoveMember,
      required this.isAddFriends});

  factory GroupModel.fromJson(jsonData) {
    return GroupModel(
        groupID: jsonData['groupID'],
        groupName: jsonData['groupName'],
        groupDescription: jsonData['groupDescription'],
        groupImage: jsonData['groupImage'],
        groupOwnerID: jsonData['groupOwnerID'],
        usersID: (jsonData['usersID'] as List<dynamic>)
            .map((userId) => userId.toString())
            .toList(),
        adminsID: (jsonData['adminsID'] as List<dynamic>)
            .map((userId) => userId.toString())
            .toList(),
        groupCreateAt: (jsonData['groupCreateAt'] as Timestamp).toDate(),
        isMemberSettings: jsonData['isMemberSettings'],
        isSendMessages: jsonData['isSendMessages'],
        isDeleteMessage: jsonData['isDeleteMessage'],
        isRemoveMember: jsonData['isRemoveMember'],
        isAddFriends: jsonData['isAddFriends']);
  }

  Map<String, dynamic> toMap() {
    return {
      'groupID': groupID,
      'groupName': groupName,
      'groupDescription': groupDescription,
      'groupImage': groupImage,
      'groupOwnerID': groupOwnerID,
      'usersID': usersID,
      'adminsID': adminsID,
      'groupCreateAt': groupCreateAt,
      'isMemberSettings': isMemberSettings,
      'isSendMessages': isSendMessages,
      'isDeleteMessage': isDeleteMessage,
      'isRemoveMember': isRemoveMember,
      'isAddFriends': isAddFriends
    };
  }

  String groupCreatedFormatted() {
    return DateFormat('dd/MM/yy').format(groupCreateAt);
  }
}
