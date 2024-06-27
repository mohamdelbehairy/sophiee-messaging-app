import 'package:flutter/material.dart';

import '../../../../../cubit/message/message_cubit.dart';
import '../../../../../cubit/notification/message_notification/message_notification_cubit.dart';
import '../../../../../cubit/pick_contact/pick_contact_cubit.dart';
import '../../../../../models/users_model.dart';

class PickContactButton extends StatelessWidget {
  const PickContactButton(
      {super.key,
      required this.message,
      required this.messageID,
      required this.phoneContactName,
      required this.phoneContactNumber,
      required this.user,
      required this.replayContactMessage,
      required this.userData,
      required this.pickContact,
      required this.sendMessageNotification,
      required this.friendData,
      required this.size});

  final MessageCubit message;
  final String messageID;
  final String phoneContactName;
  final String phoneContactNumber;
  final UserModel user;
  final String replayContactMessage;
  final UserModel userData;
  final PickContactCubit pickContact;
  final MessageNotificationCubit sendMessageNotification;
  final UserModel friendData;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.pop(context);
        await message.sendMessage(
            messageID: messageID,
            friendNameReplay: '',
            replayMessageID: '',
            imageUrl: null,
            fileUrl: null,
            phoneContactName: phoneContactName,
            phoneContactNumber: phoneContactNumber,
            receiverID: user.userID,
            messageText: '',
            replayImageMessage: '',
            replayTextMessage: '',
            replayFileMessage: '',
            replayContactMessage: replayContactMessage,
            userName: user.userName,
            profileImage: user.profileImage,
            userID: user.userID,
            myUserName: userData.userName,
            myProfileImage: userData.profileImage
            // context: context
            );
        pickContact.phoneContact == null;
        await sendMessageNotification.sendMessageNotification(
            receiverToken: friendData.token,
            senderName: userData.userName,
            message: '${userData.userName.split(' ')[0]} shared a contact',
            senderId: userData.userID);
      },
      child: Container(
        height: size.height * .07,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * .03),
            color: Colors.blue),
        child: const Center(
          child: Text(
            'Share Contact',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
