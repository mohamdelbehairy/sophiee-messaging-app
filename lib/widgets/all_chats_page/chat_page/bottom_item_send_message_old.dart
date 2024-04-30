// import 'package:app/cubit/get_user_data/get_user_data_cubit.dart';
// import 'package:app/cubit/get_user_data/get_user_data_state.dart';
// import 'package:app/cubit/message/message_cubit.dart';
// import 'package:app/models/users_model.dart';
// import 'package:app/widgets/all_chats_page/chat_page/bottom_sheet/bottom_sheet.dart';
// import 'package:app/widgets/all_chats_page/chat_page/choose_item.dart';
// import 'package:app/widgets/all_chats_page/chat_page/message_text_field.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BottomItemSendMessage extends StatefulWidget {
//   const BottomItemSendMessage(
//       {super.key,
//       required this.user,
//       required this.scrollController,
//       required this.focusNode,
//       required this.replayTextMessage,
//       required this.replayImageMessage,
//       required this.replayFileMessage,
//       required this.replayContactMessage});
//   final UserModel user;
//   final ScrollController scrollController;
//   final FocusNode focusNode;
//   final String replayTextMessage;
//   final String replayImageMessage;
//   final String replayFileMessage;
//   final String replayContactMessage;

//   @override
//   State<BottomItemSendMessage> createState() => _BottomItemSendMessageState();
// }

// class _BottomItemSendMessageState extends State<BottomItemSendMessage> {
//   bool isShowSendButton = false;
//   TextEditingController controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     var message = context.read<MessageCubit>();

//     return Padding(
//       padding: EdgeInsets.only(bottom: 4, right: 12, left: 12),
//       child: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
//         builder: (context, state) {
//           if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
//             final currentUser = FirebaseAuth.instance.currentUser;
//             if (currentUser != null) {
//               final userData = state.userModel
//                   .firstWhere((element) => element.userID == currentUser.uid);
//               return Row(
//                 children: [
//                   MessageTextField(
//                     focusNode: widget.focusNode,
//                     controller: controller,
//                     onChanged: (value) async {
//                       setState(() {
//                         isShowSendButton = value.isNotEmpty;
//                       });
//                       if (value.isNotEmpty) {
//                         await message.updateIsTyping(
//                             receiverID: widget.user.userID, isTyping: true);
//                       } else {
//                         await message.updateIsTyping(
//                             receiverID: widget.user.userID, isTyping: false);
//                       }
//                     },
//                     onPressed: () => showModalBottomSheet(
//                         backgroundColor: Colors.transparent,
//                         context: context,
//                         isScrollControlled: true,
//                         builder: (context) => ChatBottomSheet(
//                               user: widget.user,
//                               replayTextMessageImage: widget.replayTextMessage,
//                               replayImageMessageImage:
//                                   widget.replayImageMessage,
//                               replayFileMessageImage: widget.replayFileMessage,
//                               replayFileMessage: widget.replayFileMessage,
//                               replayContactMessageContact:
//                                   widget.replayContactMessage,
//                             )),
//                   ),
//                   GestureDetector(
//                       onTap: () async {
//                         if (isShowSendButton) {
//                           message.sendMessage(
//                             friendNameReplay: '',
//                             context: context,
//                             receiverID: widget.user.userID,
//                             messageText: controller.text,
//                             replayTextMessage: widget.replayTextMessage,
//                             replayImageMessage: widget.replayImageMessage,
//                             replayFileMessage: widget.replayFileMessage,
//                             replayContactMessage: widget.replayContactMessage,
//                             image: null,
//                             file: null,
//                             userName: widget.user.userName,
//                             profileImage: widget.user.profileImage,
//                             userID: widget.user.userID,
//                             myUserName: userData.userName,
//                             myProfileImage: userData.profileImage,
//                           );
//                           controller.clear();
//                           widget.scrollController.animateTo(0,
//                               duration: const Duration(microseconds: 20),
//                               curve: Curves.easeIn);
//                           setState(() {
//                             isShowSendButton = false;
//                           });
//                         } else {}
//                       },
//                       child: CustomChooseItem(
//                           icon: isShowSendButton ? Icons.send : Icons.mic)),
//                 ],
//               );
//             } else {
//               return Container();
//             }
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }
