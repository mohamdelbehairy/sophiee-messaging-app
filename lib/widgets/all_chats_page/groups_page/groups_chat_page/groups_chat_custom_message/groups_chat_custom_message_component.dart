import 'package:sophiee/cubit/delete_messages/delete_chat_message_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/cubit/groups/delete_group_messages/delete_group_messages_cubit.dart';
import 'package:sophiee/cubit/groups/high_light_group_message/high_light_messages_user/high_light_messages_user_cubit.dart';
import 'package:sophiee/cubit/groups/high_light_group_message/hight_light_messages/high_light_messages_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/pages/chats/show_chat_image_page.dart';
import 'package:sophiee/utils/widget/messages/custom_message_pop_menu_button.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/message_date_time.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_custom_message/groups_chat_custom_message_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;
import 'package:url_launcher/url_launcher.dart';

class GroupsChatCustomMessageComponenet extends StatelessWidget {
  const GroupsChatCustomMessageComponenet(
      {super.key,
      required this.message,
      required this.alignment,
      required this.backGroundMessageColor,
      required this.bottomLeft,
      required this.bottomRight,
      required this.messageTextColor,
      required this.isSeen,
      required this.groupModel});
  final MessageModel message;
  final Alignment alignment;

  final Color backGroundMessageColor;
  final Radius bottomLeft;
  final Radius bottomRight;
  final Color messageTextColor;
  final bool isSeen;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var deleteGroupMessage = context.read<DeleteGroupMessagesCubit>();
    var deleteChatMediaFiles = context.read<DeleteChatMessageCubit>();
    var hightLightMessageUser = context.read<HighLightMessagesUserCubit>();
    var hightLightMessageCubit = context.read<HightLightMessagesCubit>();

    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = message.senderID;
          final data = state.userModel
              .firstWhere((element) => element.userID == currentUser);
          return GestureDetector(
            onDoubleTap: () async {
              if (message.messageImage != null) {
                getnav.Get.to(
                    () => ShowChatImagePage(message: message, user: data),
                    transition: getnav.Transition.downToUp);
              }
              if (message.phoneContactNumber != null) {
                String url = 'tel:${message.phoneContactNumber}';
                if (await canLaunchUrl(Uri(scheme: 'tel', path: url))) {
                  await launchUrl(Uri(scheme: 'tel', path: url));
                } else {
                  debugPrint('error');
                }
              }
            },
            child: Column(
              children: [
                CustomChatPopMenuButton(
                    highLightMessagesUserCubit: hightLightMessageUser,
                    highLightMessagesCubit: hightLightMessageCubit,
                    deleteGroupMessagesCubit: deleteGroupMessage,
                    deleteChatMediaFilesCubit: deleteChatMediaFiles,
                    groupModel: groupModel,
                    size: size,
                    message: message,
                    child: GroupsChatCustomMessageDetails(
                        groupModel: groupModel,
                        message: message,
                        user: data,
                        alignment: alignment,
                        messageTextColor: messageTextColor,
                        bottomLeft: bottomLeft,
                        bottomRight: bottomRight,
                        isSeen: isSeen,
                        backGroundMessageColor: backGroundMessageColor)),
                MessageDateTime(size: size, message: message, isSeen: isSeen),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
