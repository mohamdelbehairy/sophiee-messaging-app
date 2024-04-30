import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/models/message_model.dart';

part 'delete_group_messages_state.dart';

class DeleteGroupMessagesCubit extends Cubit<DeleteGroupMessagesState> {
  DeleteGroupMessagesCubit() : super(DeleteGroupMessagesInitial());

  Future<void> deleteGroupMessage(
      {required String groupID, required MessageModel messageModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection('groups')
          .doc(groupID)
          .collection('messages')
          .doc(messageModel.messageID)
          .delete();
      await deleteGroupMediaFiles(groupID: groupID, messageModel: messageModel);
      emit(DeleteGroupMessagesSuccess());
    } catch (e) {
      debugPrint('error from delete group message method: ${e.toString()}');
      emit(DeleteGroupMessagesFailure(errorMessage: e.toString()));
    }
  }

  Future<void> deleteGroupMediaFiles(
      {required String groupID, required MessageModel messageModel}) async {
    try {
      if (messageModel.messageImage != '' || messageModel.messageVideo != '') {
        await FirebaseFirestore.instance
            .collection('groups')
            .doc(groupID)
            .collection('mediaFiles')
            .doc('media')
            .collection('media')
            .doc(messageModel.messageID)
            .delete();
      }

      if (messageModel.messageSound != '' || messageModel.messageRecord != '') {
        await FirebaseFirestore.instance
            .collection('groups')
            .doc(groupID)
            .collection('mediaFiles')
            .doc('voice')
            .collection('voice')
            .doc(messageModel.messageID)
            .delete();
      }

      if (messageModel.messageFile != '') {
        await FirebaseFirestore.instance
            .collection('groups')
            .doc(groupID)
            .collection('mediaFiles')
            .doc('files')
            .collection('files')
            .doc(messageModel.messageID)
            .delete();
      }
      if (messageModel.messageText.startsWith('http') ||
          messageModel.messageText.startsWith('https')) {
        await FirebaseFirestore.instance
            .collection('groups')
            .doc(groupID)
            .collection('mediaFiles')
            .doc('links')
            .collection('links')
            .doc(messageModel.messageID)
            .delete();
      }

      emit(DeleteGroupMediaFilesSuccess());
    } catch (e) {
      debugPrint('error from delete group media method: ${e.toString()}');
      emit(DeleteGroupMediaFilesFailure(errorMessage: e.toString()));
    }
  }
}
