// import 'package:app/cubit/message/message_cubit.dart';
// import 'package:app/cubit/message/message_state.dart';
// import 'package:app/models/users_model.dart';
// import 'package:app/utils/shimmer/home/all_chats/chat_page/message_page_shimmer.dart';

// import 'package:app/widgets/all_chats_page/chat_page/custom_chat_page_body.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ChatPageBody extends StatelessWidget {
//   const ChatPageBody({super.key, required this.user});
//   final UserModel user;

//   @override
//   Widget build(BuildContext context) {
//     final messages = context.read<MessageCubit>();

//     return BlocConsumer<MessageCubit, MessageState>(
//       listener: (context, state) async {
//         if (state is DeleteMessageSuccess) {
//           if (await messages.isChatsEmpty(friendID: user.userID)) {
//             messages.deleteChat(friendID: user.lastMessage?['lastUserID']);
//           }
//         }
//       },
//       builder: (context, state) {
//         if (state is MessageLoading) {
//           return MessagePageShimmer();
//         }
//         return CustomChatPageBody(user: user);
//       },
//     );
//   }
// }
