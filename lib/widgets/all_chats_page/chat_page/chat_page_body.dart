import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_body_component.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_app_bar_title.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chats_icons_app_bar_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/constants.dart';

import '../../../cubit/connectivity/connectivity_cubit.dart';
import '../../../utils/initial_state.dart';
import '../../../utils/shimmer/home/all_chats/chat_page/message_page_shimmer.dart';

class ChatPageBody extends StatelessWidget {
  const ChatPageBody(
      {super.key,
      required this.size,
      required this.user,
      required this.userData});

  final Size size;
  final UserModel user;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return Scaffold(
        backgroundColor: userData.chatbackgroundColor != null
            ? Color(userData.chatbackgroundColor!)
            : isDark && userData.chatbackgroundColor == null
                ? chatDarkModeBackground
                : chatLightModeBackground,
        appBar: AppBar(
          titleSpacing: -8.0,
          backgroundColor: kPrimaryColor,
          elevation: 0,
          title: ChatPageAppBarTitle(user: user),
          iconTheme: const IconThemeData(size: 35, color: Colors.white),
          leading: GestureDetector(
              onTap: () {
                InitialState.initPickContactState(context);
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back)),
          actions: const [
            ChatsIconsAppBarButton(icon: Icons.call),
            ChatsIconsAppBarButton(icon: FontAwesomeIcons.video),
            ChatsIconsAppBarButton(icon: Icons.error),
          ],
        ),
        body: BlocBuilder<ConnectivityCubit, ConnectivityResult>(
          builder: (context, connectivityState) {
            if (connectivityState == ConnectivityResult.mobile ||
                connectivityState == ConnectivityResult.wifi ||
                connectivityState == ConnectivityResult.vpn) {
              return Container(
                  decoration: BoxDecoration(
                      image: userData.chatbackgroundImage != null
                          ? DecorationImage(
                              image: CachedNetworkImageProvider(
                                  userData.chatbackgroundImage!),
                              fit: BoxFit.cover)
                          : null),
                  child: ChatPageBodyComponent(
                      user: user, size: size, userDataModel: userData));
            } else {
              return const MessagePageShimmer();
            }
          },
        ));
  }
}
