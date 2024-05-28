import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userName,
      emailAddress,
      userID,
      bio,
      nickName,
      dateOfBirth,
      gender,
      profileImage;
  final DateTime onlineStatue;
  Map<String, dynamic>? lastMessage;
  bool? isGoogleAuth, isEmailAuth, isFacebookAuth, isFollowing;
  String? phoneNumber, token, chatbackgroundImage;
  int? chatbackgroundColor;
  final bool isStory,
      isChatNotify,
      isGroupNotify,
      isStoryNotify,
      isLivesNotify,
      isPinnedMessageNotify,
      isPhoneAndEmail,
      isLastSeendAndOnline,
      isProfilePhotos,
      isDateOfBirth,
      isBioAndNickName,
      isAudioAndVideoCall;
  List<dynamic> muteUsers;

  UserModel(
      {required this.userName,
      required this.emailAddress,
      required this.userID,
      required this.bio,
      required this.nickName,
      required this.profileImage,
      required this.gender,
      this.phoneNumber,
      required this.onlineStatue,
      required this.dateOfBirth,
      required this.isStory,
      this.lastMessage,
      this.isGoogleAuth,
      this.isEmailAuth,
      this.isFacebookAuth,
      this.token,
      this.isFollowing,
      this.chatbackgroundImage,
      this.chatbackgroundColor,
      required this.isChatNotify,
      required this.isGroupNotify,
      required this.isStoryNotify,
      required this.isLivesNotify,
      required this.isPinnedMessageNotify,
      required this.isPhoneAndEmail,
      required this.isLastSeendAndOnline,
      required this.isProfilePhotos,
      required this.isDateOfBirth,
      required this.isBioAndNickName,
      required this.isAudioAndVideoCall,
      required this.muteUsers});

  factory UserModel.fromJson(jsonData) {
    return UserModel(
        userName: jsonData['userName'] ?? '',
        emailAddress: jsonData['emailAddress'] ?? '',
        userID: jsonData['userID'] ?? '',
        bio: jsonData['bio'] ?? '',
        nickName: jsonData['nickName'] ?? '',
        profileImage: jsonData['profileImage'] ?? '',
        dateOfBirth: jsonData['dateOfBirth'] ?? '',
        phoneNumber: jsonData['phoneNumber'],
        gender: jsonData['gender'] ?? '',
        onlineStatue: (jsonData['onlineStatue'] ?? Timestamp.now()).toDate(),
        isStory: jsonData['isStory'] ?? false,
        lastMessage: jsonData['lastMessage'],
        isGoogleAuth: jsonData['isGoogleAuth'],
        isEmailAuth: jsonData['isEmailAuth'],
        isFacebookAuth: jsonData['isFacebookAuth'],
        token: jsonData['token'],
        isFollowing: jsonData['isFollowing'],
        chatbackgroundImage: jsonData['chatbackgroundImage'],
        chatbackgroundColor: jsonData['chatbackgroundColor'],
        isChatNotify: jsonData['isChatNotify'] ?? false,
        isGroupNotify: jsonData['isGroupNotify'] ?? false,
        isStoryNotify: jsonData['isStoryNotify'] ?? false,
        isLivesNotify: jsonData['isLivesNotify'] ?? false,
        isPinnedMessageNotify: jsonData['isPinnedMessageNotify'] ?? false,
        isPhoneAndEmail: jsonData['isPhoneAndEmail'] ?? false,
        isLastSeendAndOnline: jsonData['isLastSeendAndOnline'] ?? false,
        isProfilePhotos: jsonData['isProfilePhotos'] ?? false,
        isDateOfBirth: jsonData['isDateOfBirth'] ?? false,
        isBioAndNickName: jsonData['isBioAndNickName'] ?? false,
        isAudioAndVideoCall: jsonData['isAudioAndVideoCall'] ?? false,
        muteUsers: jsonData['muteUsers'] ?? []);
  }
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'emailAddress': emailAddress,
      'userID': userID,
      'bio': bio,
      'nickName': nickName,
      'profileImage': profileImage,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'onlineStatue': onlineStatue,
      'isStory': isStory,
      // 'lastMessage': lastMessage,
      'isGoogleAuth': isGoogleAuth,
      'isEmailAuth': isEmailAuth,
      'isFacebookAuth': isFacebookAuth,
      'token': token,
      'isChatNotify': isChatNotify,
      'isGroupNotify': isGroupNotify,
      'isStoryNotify': isStoryNotify,
      'isLivesNotify': isLivesNotify,
      'isPinnedMessageNotify': isPinnedMessageNotify,
      'isPhoneAndEmail': isPhoneAndEmail,
      'isLastSeendAndOnline': isLastSeendAndOnline,
      'isProfilePhotos': isProfilePhotos,
      'isDateOfBirth': isDateOfBirth,
      'isBioAndNickName': isBioAndNickName,
      'isAudioAndVideoCall': isAudioAndVideoCall,
      'muteUsers': muteUsers
    };
  }

  String formattedTime() {
    if (lastMessage != null && lastMessage!['lastMessageDateTime'] != null) {
      Timestamp timestamp = lastMessage!['lastMessageDateTime'];
      DateTime dateTime = timestamp.toDate();
      return '$dateTime';
    } else {
      return '';
    }
  }
}
