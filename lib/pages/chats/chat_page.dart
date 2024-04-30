import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/chats/chats_cubit.dart';
import 'package:sophiee/cubit/connectivity/connectivity_cubit.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_cubit.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_body.dart';
import 'package:sophiee/utils/shimmer/home/all_chats/chat_page/message_page_shimmer.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_app_bar_title.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chats_icons_app_bar_button.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_contact_bottom_sheet.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    context.read<ChatsCubit>().chats();
    return Scaffold(
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
      body: BlocBuilder<PickContactCubit, PickContactState>(
        builder: (context, state) {
          if (state is PickContactSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => PickContactBottomSheet(
                    user: user,
                    phoneContactName: state.phoneContact.fullName!.toString(),
                    phoneContactNumber:
                        state.phoneContact.phoneNumber!.number.toString()),
              );
            });
          }
          return BlocBuilder<ConnectivityCubit, ConnectivityResult>(
            builder: (context, state) {
              if (state == ConnectivityResult.mobile ||
                  state == ConnectivityResult.wifi) {
                return SafeArea(child: ChatPageBody(user: user, size: size));
              } else {
                return const MessagePageShimmer();
              }
            },
          );
        },
      ),
    );
  }
}
