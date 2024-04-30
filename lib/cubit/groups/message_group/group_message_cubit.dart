import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/groups/message_group/group_message_state.dart';
import 'package:sophiee/models/message_model.dart';

class GroupMessageCubit extends Cubit<GroupMessageState> {
  GroupMessageCubit() : super(GroupMessageInitial());

  Future<void> sendGroupMessage({
    required String messageText,
    required String groupID,
    required String messageID,
    String? imageUrl,
    String? videoUrl,
    String? phoneContactNumber,
    String? phoneContactName,
    String? fileUrl,
    String? messageFileName,
    String? audioUrl,
    String? audioName,
    String? audioTime,
    String? recordUrl,
    String? recordTime,
    String? replayTextMessage,
    required String replayImageMessage,
    String? replayFileMessage,
    String? replayContactMessage,
    required String friendNameReplay,
    required String replayMessageID,
    String? replaySoundMessage,
    String? replayRecordMessage,
  }) async {
    try {
      MessageModel message = MessageModel.fromJson({
        'senderID': FirebaseAuth.instance.currentUser!.uid,
        'receiverID': '',
        'messageID': messageID,
        'messageText': messageText,
        'messageDateTime': Timestamp.now(),
        'isSeen': false,
        'groupChatUsersIDSeen': [],
        'messageImage': imageUrl,
        'messageFile': fileUrl,
        'messageVideo': videoUrl,
        'messageFileName': messageFileName,
        'phoneContactNumber': phoneContactNumber,
        'phoneContactName': phoneContactName,
        'messageSound': audioUrl,
        'messageSoundName': audioName,
        'messageSoundTime': audioTime,
        'messageSoundPlaying': audioUrl != null ? false : null,
        'messageRecord': recordUrl,
        'messageRecordTime': recordTime,
        'replayTextMessage': replayTextMessage,
        'replayImageMessage': replayImageMessage,
        'replayFileMessage': replayFileMessage,
        'replayContactMessage': replayContactMessage,
        'friendNameReplay': friendNameReplay,
        'replayMessageID': replayMessageID,
        'replaySoundMessage': replaySoundMessage,
        'replayRecordMessage': replayRecordMessage,
        'highlightMessage': [],
      });

      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .collection('messages')
          .doc(message.messageID)
          .set(message.toMap());

      emit(SendMessageGroupSuccess());
    } catch (e) {
      emit(SendMessageGroupFailure(errorMessage: e.toString()));
      debugPrint('error from send group message: ${e.toString()}');
    }
  }

  List<MessageModel> groupMessageList = [];
  void getGroupMessage({required String groupID}) {
    emit(GetMessageGroupsLoading());
    try {
      FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .collection('messages')
          .orderBy('messageDateTime', descending: true)
          .snapshots()
          .listen((snapshot) {
        groupMessageList = [];
        for (var element in snapshot.docs) {
          groupMessageList.add(MessageModel.fromJson(element.data()));
        }
        emit(GetMessageGroupsSuccess());
      });
    } catch (e) {
      debugPrint('error from get group message method: ${e.toString()}');
      emit(GetMessageGroupFailure(errorMessage: e.toString()));
    }
  }

  Future<void> updateGroupsChatMessageSeen({
    required String groupID,
    required String messageID,
    required List<dynamic> groupChatUsersIDSeen,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .collection('messages')
          .doc(messageID)
          .update({
        'isSeen': true,
        'groupChatUsersIDSeen': FieldValue.arrayUnion(groupChatUsersIDSeen)
      });
    } catch (e) {
      debugPrint(
          'error from update Groups Chat Message Seen method: ${e.toString()}');
    }
  }
}
