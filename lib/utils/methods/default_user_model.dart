 import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constants.dart';
import '../../models/users_model.dart';

UserModel defaultUserModel({required String userID}) {
    return UserModel(
        userName: 'Deleted Account',
        emailAddress: '',
        userID: userID,
        bio: '',
        nickName: '',
        profileImage: defaultProfileImageUrl,
        gender: '',
        onlineStatue: Timestamp.now().toDate(),
        dateOfBirth: '',
        isStory: false,
        isLive: false,
        isChatNotify: false,
        isGroupNotify: false,
        isStoryNotify: false,
        isLivesNotify: false,
        isPinnedMessageNotify: false,
        isPhoneAndEmail: false,
        isLastSeendAndOnline: false,
        isProfilePhotos: false,
        isDateOfBirth: false,
        isBioAndNickName: false,
        isAudioAndVideoCall: false,
        muteUsers: const [],
        isProfileLock: true,
        blockUsers: const []);
  }