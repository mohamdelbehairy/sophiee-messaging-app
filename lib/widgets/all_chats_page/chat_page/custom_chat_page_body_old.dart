// import 'package:app/constants.dart';
// import 'package:app/cubit/message/message_cubit.dart';
// import 'package:app/cubit/message/message_state.dart';
// import 'package:app/models/message_model.dart';
// import 'package:app/models/users_model.dart';
// import 'package:app/widgets/all_chats_page/chat_page/bottom_item_send_message.dart';
// import 'package:app/widgets/all_chats_page/chat_page/custom_message/custom_message.dart';
// import 'package:app/widgets/all_chats_page/replay_message/replay_contact_message.dart';
// import 'package:app/widgets/all_chats_page/replay_message/replay_file_message.dart';
// import 'package:app/widgets/all_chats_page/replay_message/replay_image_message.dart';
// import 'package:app/widgets/all_chats_page/replay_message/replay_text_message.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:swipe_to/swipe_to.dart';

// class CustomChatPageBody extends StatefulWidget {
//   const CustomChatPageBody({super.key, required this.user});

//   final UserModel user;

//   @override
//   State<CustomChatPageBody> createState() => _CustomChatPageBodyState();
// }

// class _CustomChatPageBodyState extends State<CustomChatPageBody> {
//   TextEditingController controller = TextEditingController();
//   final _controller = ScrollController();
//   bool isSwip = false;
//   MessageModel? messageModel;
//   late FocusNode focusNode;

//   @override
//   void initState() {
//     super.initState();
//     // context.read<MessageCubit>().getMessage(receiverID: widget.user.userID);
//     focusNode = FocusNode();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//     _controller.dispose();
//     focusNode.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final messages = context.read<MessageCubit>();
//     final size = MediaQuery.of(context).size;

//     return BlocListener<MessageCubit, MessageState>(
//       listener: (context, state) {
//         if (state is SendMessageSuccess) {
//           isSwip = false;
//         }
//       },
//       child: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               reverse: true,
//               controller: _controller,
//               physics: const BouncingScrollPhysics(),
//               itemCount: messages.messages.length,
//               itemBuilder: (context, index) {
//                 var message = context.read<MessageCubit>().messages[index];
//                 if (!message.isSeen &&
//                     message.senderID !=
//                         FirebaseAuth.instance.currentUser!.uid) {
//                   messages.updateChatMessageSeen(
//                       receiverID: widget.user.userID,
//                       messageID: message.messageID);
//                 }

//                 return SwipeTo(
//                   onLeftSwipe: (e) {
//                     setState(() {
//                       isSwip = !isSwip;
//                       messageModel = message;
//                       focusNode.requestFocus();
//                     });
//                   },
//                   key: Key(message.messageID),
//                   child: CustomMessage(
//                       user: widget.user,
//                       message: message,
//                       isSeen: message.isSeen,
//                       bottomLeft: message.senderID ==
//                               FirebaseAuth.instance.currentUser!.uid
//                           ? Radius.circular(size.width * .03)
//                           : Radius.circular(0),
//                       bottomRight: message.senderID ==
//                               FirebaseAuth.instance.currentUser!.uid
//                           ? Radius.circular(0)
//                           : Radius.circular(size.width * .03),
//                       alignment: message.senderID ==
//                               FirebaseAuth.instance.currentUser!.uid
//                           ? Alignment.centerRight
//                           : Alignment.centerLeft,
//                       backGroundMessageColor: message.senderID ==
//                               FirebaseAuth.instance.currentUser!.uid
//                           ? kPrimaryColor
//                           : Color(0xffe8f8f8),
//                       messageTextColor: message.senderID ==
//                               FirebaseAuth.instance.currentUser!.uid
//                           ? Colors.white
//                           : Colors.black),
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: size.height * .01),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (isSwip)
//                 if (messageModel!.messageText != '' &&
//                     messageModel!.messageImage == null &&
//                     messageModel!.messageFileName == null)
//                   ReplayTextMessage(
//                       user: widget.user,
//                       messageModel: messageModel!,
//                       onTap: () {
//                         setState(() {
//                           isSwip = false;
//                         });
//                       }),
//               if (isSwip)
//                 if (messageModel!.messageImage != null &&
//                     messageModel!.messageText == '')
//                   ReplayImageMessage(
//                       messageModel: messageModel!,
//                       user: widget.user,
//                       onTap: () {
//                         setState(() {
//                           isSwip = false;
//                         });
//                       }),
//               if (isSwip)
//                 if (messageModel!.messageImage != null &&
//                     messageModel!.messageText != '')
//                   ReplayImageMessage(
//                       messageModel: messageModel!,
//                       user: widget.user,
//                       onTap: () {
//                         setState(() {
//                           isSwip = false;
//                         });
//                       }),
//               if (isSwip)
//                 if (messageModel!.messageFile != null)
//                   ReplayFileMessage(
//                     messageModel: messageModel!,
//                     user: widget.user,
//                     onTap: () {
//                       setState(() {
//                         isSwip = false;
//                       });
//                     },
//                   ),
//               if (isSwip)
//                 if (messageModel!.phoneContactNumber != null)
//                   ReplayContactMessage(
//                       messageModel: messageModel!,
//                       user: widget.user,
//                       onTap: () {
//                         setState(() {
//                           isSwip = false;
//                         });
//                       }),
//               SizedBox(height: size.height * .003),
//               BottomItemSendMessage(
//                 replayTextMessage: isSwip ? messageModel!.messageText : '',
//                 replayImageMessage: isSwip
//                     ? messageModel!.messageImage != null &&
//                                 messageModel!.messageText == '' ||
//                             messageModel!.messageImage != null &&
//                                 messageModel!.messageText != ''
//                         ? messageModel!.messageImage!
//                         : ''
//                     : '',
//                 replayFileMessage:
//                     isSwip && messageModel!.messageFileName != null
//                         ? messageModel!.messageFileName!
//                         : '',
//                 replayContactMessage:
//                     isSwip && messageModel!.phoneContactNumber != null
//                         ? messageModel!.phoneContactNumber!
//                         : '',
//                 focusNode: focusNode,
//                 // controller: controller,
//                 scrollController: _controller,
//                 user: widget.user,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
