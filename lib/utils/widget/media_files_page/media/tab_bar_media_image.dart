import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/media_files_model.dart';
import 'package:sophiee/pages/chats/show_chat_image_page.dart';

class TabBarMediaImage extends StatelessWidget {
  const TabBarMediaImage({super.key, required this.mediaFiels});

  final MediaFilesModel mediaFiels;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = mediaFiels.senderID;
          final data = state.userModel
              .firstWhere((element) => element.userID == currentUser);
          return GestureDetector(
            onTap: () => getnav.Get.to(
                () => ShowChatImagePage(mediaFiels: mediaFiels, user: data),
                transition: getnav.Transition.leftToRight),
            child: FancyShimmerImage(
                boxFit: BoxFit.cover,
                shimmerBaseColor: Colors.grey.shade100,
                shimmerHighlightColor: Colors.grey.shade300,
                imageUrl: mediaFiels.messageImage!),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
