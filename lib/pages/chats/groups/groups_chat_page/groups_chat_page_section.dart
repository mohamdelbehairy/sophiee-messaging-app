import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/connectivity/connectivity_cubit.dart';
import '../../../../models/group_model.dart';
import '../../../../models/users_model.dart';
import '../../../../utils/shimmer/home/all_chats/chat_page/message_page_shimmer.dart';
import '../../../../widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_body_details.dart';

class GroupsChatPageSection extends StatelessWidget {
  const GroupsChatPageSection(
      {super.key,
      required this.userData,
      required this.size,
      required this.onChanged,
      required this.groupData,
      required this.scrollController,
      required this.controller,
      required this.isShowSendButton});

  final UserModel userData;
  final Size size;
  final Function(String p1) onChanged;
  final GroupModel groupData;
  final ScrollController scrollController;
  final TextEditingController controller;
  final bool isShowSendButton;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityResult>(
      builder: (context, connectivityState) {
        if (connectivityState == ConnectivityResult.mobile ||
            connectivityState == ConnectivityResult.wifi ||
            connectivityState == ConnectivityResult.vpn) {
          return Container(
              decoration: userData.chatbackgroundImage != null
                  ? BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              userData.chatbackgroundImage!),
                          fit: BoxFit.cover))
                  : null,
              child: GroupsChatPageBodyDetails(
                  userDataModel: userData,
                  size: size,
                  onChanged: onChanged,
                  groupModel: groupData,
                  scrollController: scrollController,
                  controller: controller,
                  isShowSendButton: isShowSendButton));
        } else {
          return const MessagePageShimmer();
        }
      },
    );
  }
}
