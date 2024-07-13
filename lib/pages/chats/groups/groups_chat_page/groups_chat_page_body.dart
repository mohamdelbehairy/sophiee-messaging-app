import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/auth/login/login_cubit.dart';
import '../../../../models/group_model.dart';
import 'group_chat_app_bar.dart';
import 'groups_chat_page_section.dart';

class GroupsChatPageBody extends StatelessWidget {
  const GroupsChatPageBody(
      {super.key,
      required this.groupID,
      required this.size,
      required this.scrollController,
      required this.controller,
      required this.isShowSendButton,
      required this.onChanged,
      this.groupModel});
  final String groupID;
  final Size size;
  final ScrollController scrollController;
  final TextEditingController controller;
  final bool isShowSendButton;
  final Function(String) onChanged;
  final GroupModel? groupModel;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final userData = state.userModel.firstWhere((element) =>
              element.userID == FirebaseAuth.instance.currentUser!.uid);
          return Scaffold(
              backgroundColor: userData.chatbackgroundColor != null
                  ? Color(userData.chatbackgroundColor!)
                  : isDark && userData.chatbackgroundColor == null
                      ? chatDarkModeBackground
                      : chatLightModeBackground,
              appBar: groupChatAppBar(
                  isDark: isDark,
                  context: context,
                  groupModel: groupModel,
                  groupID: groupID,
                  size: size),
              body: GroupsChatPageSection(
                  groupModel: groupModel!,
                  userData: userData,
                  size: size,
                  onChanged: onChanged,
                  groupID: groupID,
                  scrollController: scrollController,
                  controller: controller,
                  isShowSendButton: isShowSendButton));
        } else {
          return Container();
        }
      },
    );
  }
}
