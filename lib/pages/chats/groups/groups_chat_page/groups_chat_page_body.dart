import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_cubit.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/utils/initial_state.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chats_icons_app_bar_button.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_app_bar.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_body_details.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_pick_items/groups_chat_bottom_sheet_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../cubit/auth/login/login_cubit.dart';

class GroupsChatPageBody extends StatelessWidget {
  const GroupsChatPageBody(
      {super.key,
      required this.groupModel,
      required this.size,
      required this.scrollController,
      required this.controller,
      required this.isShowSendButton,
      required this.onChanged});
  final GroupModel groupModel;
  final Size size;
  final ScrollController scrollController;
  final TextEditingController controller;
  final bool isShowSendButton;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return Scaffold(
      backgroundColor:
          isDark ? chatDarkModeBackground : chatLightModeBackground,
      appBar: AppBar(
        titleSpacing: -8,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: GroupsChatPageAppBar(
            groupData: groupModel, isDark: isDark, size: size),
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
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: BlocBuilder<PickContactCubit, PickContactState>(
        builder: (context, state) {
          if (state is PickContactSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => GroupsChatPickContactBottomSheet(
                      groupModel: groupModel,
                      phoneContactName: state.phoneContact.fullName!.toString(),
                      phoneContactNumber:
                          state.phoneContact.phoneNumber!.number.toString()));
            });
          }
          return GroupsChatPageBodyDetails(
              size: size,
              onChanged: onChanged,
              groupModel: groupModel,
              scrollController: scrollController,
              controller: controller,
              isShowSendButton: isShowSendButton);
        },
      ),
    );
  }
}
