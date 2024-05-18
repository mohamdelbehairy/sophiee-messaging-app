import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophiee/cubit/chats/chats_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_body.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.userID});
  final String userID;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    context.read<ChatsCubit>().chats();

    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final user =
              state.userModel.firstWhere((element) => element.userID == userID);
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
