import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_body_component.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_app_bar_title.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chats_icons_app_bar_button.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_cubit.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/constants.dart';

class ChatPageBody extends StatelessWidget {
  const ChatPageBody({super.key, required this.size, required this.user});

  final Size size;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: chatLightModeBackground,
      appBar: AppBar(
        titleSpacing: size.width * -.02,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: ChatPageAppBarTitle(user: user),
        iconTheme: const IconThemeData(size: 35, color: Colors.white),
        leading: GestureDetector(
            onTap: () {
              context.read<PickContactCubit>().emit(PickContactInitial());
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        actions: const [
          ChatsIconsAppBarButton(icon: Icons.call),
          ChatsIconsAppBarButton(icon: FontAwesomeIcons.video),
          ChatsIconsAppBarButton(icon: Icons.error),
        ],
      ),
      body: ChatPageBodyComponent(user: user, size: size),
    );
  }
}
