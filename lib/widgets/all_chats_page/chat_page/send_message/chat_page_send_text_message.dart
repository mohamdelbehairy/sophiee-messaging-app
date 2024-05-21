import 'package:sophiee/cubit/chat_media_files/chat_store_media_files/chat_store_media_files_cubit.dart';
import 'package:sophiee/cubit/notification/message_notification/message_notification_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/send_message/send_message_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class ChatPageSendTextMessageButton extends StatelessWidget {
  const ChatPageSendTextMessageButton(
      {super.key,
      required this.messages,
      required this.user,
      required this.textEditingController,
      required this.replayTextMessage,
      required this.friendNameReplay,
      required this.replayImageMessage,
      required this.replayFileMessage,
      required this.replayContactMessage,
      required this.replayMessageID,
      required this.scrollController,
      required this.replaySoundMessage,
      required this.replayRecordMessage});

  final MessageCubit messages;
  final UserModel user;
  final TextEditingController textEditingController;
  final ScrollController scrollController;
  final String replayTextMessage;
  final String friendNameReplay;
  final String replayImageMessage;
  final String replayFileMessage;
  final String replayContactMessage;
  final String replayMessageID;
  final String replaySoundMessage;
  final String replayRecordMessage;

  @override
  Widget build(BuildContext context) {
    var storeMedia = context.read<ChatStoreMediaFilesCubit>();
    var sendMessageNotification = context.read<MessageNotificationCubit>();

    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = FirebaseAuth.instance.currentUser;
          final friendUser = user.userID;
          final friendData = state.userModel
              .firstWhere((element) => element.userID == friendUser);
          if (currentUser != null) {
            final userData = state.userModel
                .firstWhere((element) => element.userID == currentUser.uid);
            String messageID = const Uuid().v4();
            return SendMessageButton(
                onTap: () async {
                  messages.sendMessage(
                      receiverID: user.userID,
                      messageID: messageID,
                      messageText: textEditingController.text,
                      userName: user.userName,
                      profileImage: user.profileImage,
                      userID: user.userID,
                      myUserName: userData.userName,
                      myProfileImage: userData.profileImage,
                      replayImageMessage: replayImageMessage,
                      friendNameReplay: friendNameReplay,
                      replayMessageID: replayMessageID,
                      replayContactMessage: replayContactMessage,
                      replayFileMessage: replayFileMessage,
                      replayTextMessage: replayTextMessage,
                      replaySoundMessage: replaySoundMessage,
                      replayRecordMessage: replayRecordMessage);
                  debugPrint('userToken: ${friendData.token}');
                  debugPrint('userID: ${user.userID}');
                  debugPrint('userName: ${user.userName}');
                  if (user.isChatNotify) {
                    sendMessageNotification.sendMessageNotification(
                        receiverToken: friendData.token,
                        senderName: userData.userName,
                        message: textEditingController.text,
                        senderId: userData.userID);
                  }

                  if (textEditingController.text.startsWith('http') ||
                      textEditingController.text.startsWith('https')) {
                    storeMedia.storeLink(
                        messageID: messageID,
                        friendID: user.userID,
                        messageLink: textEditingController.text);
                  }

                  textEditingController.clear();
                  scrollController.animateTo(0,
                      duration: const Duration(microseconds: 20),
                      curve: Curves.easeIn);
                },
                icon: Icons.send);
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }
}
