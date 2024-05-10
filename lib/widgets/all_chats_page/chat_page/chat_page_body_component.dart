import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/connectivity/connectivity_cubit.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_cubit.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/shimmer/home/all_chats/chat_page/message_page_shimmer.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_body_details.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_contact_bottom_sheet.dart';

class ChatPageBodyComponent extends StatelessWidget {
  const ChatPageBodyComponent({super.key, required this.user, required this.size});

  final UserModel user;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PickContactCubit, PickContactState>(
      builder: (context, constactState) {
        if (constactState is PickContactSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => PickContactBottomSheet(
                  user: user,
                  phoneContactName:
                      constactState.phoneContact.fullName!.toString(),
                  phoneContactNumber: constactState
                      .phoneContact.phoneNumber!.number
                      .toString()),
            );
          });
        }
        return BlocBuilder<ConnectivityCubit, ConnectivityResult>(
          builder: (context, connectivityState) {
            if (connectivityState == ConnectivityResult.mobile ||
                connectivityState == ConnectivityResult.wifi) {
              return SafeArea(
                  child: ChatPageBodyDetails(user: user, size: size));
            } else {
              return const MessagePageShimmer();
            }
          },
        );
      },
    );
  }
}
