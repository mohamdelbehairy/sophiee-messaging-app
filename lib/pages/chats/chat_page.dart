import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophiee/cubit/chats/chats_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/utils/methods/default_user_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_body.dart';

import '../../cubit/message/message_cubit.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.userID});
  final String userID;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    context.read<MessageCubit>().getMessage(receiverID: widget.userID);
    context.read<ChatsCubit>().chats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final user = state.userModel.firstWhere(
              (element) => element.userID == widget.userID,
              orElse: () => defaultUserModel(userID: widget.userID));
          final userData = state.userModel.firstWhere((element) =>
              element.userID == FirebaseAuth.instance.currentUser!.uid);

          return ChatPageBody(size: size, user: user, userData: userData);
        } else {
          return Container();
        }
      },
    );
  }
}
