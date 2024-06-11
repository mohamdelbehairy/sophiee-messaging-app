import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/utils/initial_state.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chats_icons_app_bar_button.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../cubit/auth/login/login_cubit.dart';
import '../../../../models/group_model.dart';
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
              appBar: AppBar(
                  titleSpacing: -8,
                  backgroundColor: kPrimaryColor,
                  elevation: 0,
                  title: GroupsChatPageAppBar(
                      groupModel: groupModel,
                      groupID: groupID,
                      isDark: isDark,
                      size: size),
                  actions: const [
                    ChatsIconsAppBarButton(icon: Icons.call),
                    ChatsIconsAppBarButton(icon: FontAwesomeIcons.video),
                    ChatsIconsAppBarButton(icon: Icons.error)
                  ],
                  leading: GestureDetector(
                      onTap: () {
                        InitialState.initPickContactState(context);
                        Navigator.pop(context);
                      },
                      child:
                          const Icon(Icons.arrow_back, color: Colors.white))),
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
