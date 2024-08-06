import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getnav;
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/media_files_model.dart';
import 'package:sophiee/pages/chats/show_chat_video_page.dart';

class PositionedVideoIcon extends StatelessWidget {
  const PositionedVideoIcon(
      {super.key, required this.size, required this.mediaFiels});

  final Size size;
  final MediaFilesModel mediaFiels;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = mediaFiels.senderID;
          final data = state.userModel
              .firstWhere((element) => element.userID == currentUser);
          return Positioned.fill(
              child: InkWell(
            onTap: () => getnav.Get.to(
                () => ShowChatVideoPage(mediaFiels: mediaFiels, user: data),
                transition: getnav.Transition.rightToLeft),
            child: Icon(FontAwesomeIcons.expand,
                color: Colors.transparent, size: size.width * .035),
          ));
        } else {
          return Container();
        }
      },
    );
  }
}
