import 'package:sophiee/cubit/chat_media_files/chat_store_media_files/chat_store_media_files_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/cubit/upload/upload_audio/upload_audio_cubit.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/chats/recorder_item.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_body_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class CustomChatSendRecord extends StatelessWidget {
  const CustomChatSendRecord(
      {super.key,
      required this.uploadAudio,
      required this.messages,
      required this.widget,
      required this.isSwip,
      required this.messageModel,
      required this.userData,
      this.stopRecording});

  final UploadAudioCubit uploadAudio;
  final MessageCubit messages;
  final ChatPageBodyDetails widget;
  final bool isSwip;
  final MessageModel? messageModel;
  final UserModel? userData;
  final Function(String)? stopRecording;

  @override
  Widget build(BuildContext context) {
    var storeMedia = context.read<ChatStoreMediaFilesCubit>();

    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = FirebaseAuth.instance.currentUser;
          if (currentUser != null) {
            final data = state.userModel
                .firstWhere((element) => element.userID == currentUser.uid);
            return RecorderItem(
              stopRecording: stopRecording,
              sendRequestFunction: (soundFile, time) async {
                String recordUrl = await uploadAudio.uploadAudio(
                    audioFile: soundFile, audioField: 'messages_record');
                String messageID = const Uuid().v4();
                await messages.sendMessage(
                    messageID: messageID,
                    recordUrl: recordUrl,
                    recordTime: time,
                    receiverID: widget.user.userID,
                    messageText: '',
                    userName: widget.user.userName,
                    profileImage: widget.user.profileImage,
                    userID: widget.user.userID,
                    myUserName: data.userName,
                    myProfileImage: data.profileImage,
                    replayTextMessage: isSwip ? messageModel!.messageText : '',
                    friendNameReplay: isSwip
                        ? userData != null
                            ? userData!.userName
                            : ''
                        : '',
                    replayImageMessage: isSwip
                        ? messageModel!.messageImage != null &&
                                    messageModel!.messageText == '' ||
                                messageModel!.messageImage != null &&
                                    messageModel!.messageText != ''
                            ? messageModel!.messageImage!
                            : ''
                        : '',
                    replayFileMessage:
                        isSwip && messageModel!.messageFileName != null
                            ? messageModel!.messageFileName!
                            : '',
                    replayContactMessage:
                        isSwip && messageModel!.phoneContactNumber != null
                            ? messageModel!.phoneContactNumber!
                            : '',
                    replayMessageID: isSwip ? messageModel!.messageID : '',
                    replaySoundMessage:
                        isSwip && messageModel!.messageSound != null
                            ? messageModel!.messageSoundName
                            : '',
                    replayRecordMessage:
                        isSwip && messageModel!.messageRecord != null
                            ? messageModel!.messageRecord
                            : '');
                await storeMedia.storeVoice(
                    friendID: widget.user.userID,
                    messageID: messageID,
                    messageRecord: recordUrl);
              },
              size: widget.size,
            );
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
