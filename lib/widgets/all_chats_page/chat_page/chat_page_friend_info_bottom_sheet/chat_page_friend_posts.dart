import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/user_date/image/get_image/get_image_cubit.dart';
import 'chat_page_friend_details.dart';

class ChatPageFriendPosts extends StatelessWidget {
  const ChatPageFriendPosts({super.key});

  @override
  Widget build(BuildContext context) {
    var images = context.read<GetImageCubit>();
    return BlocBuilder<GetImageCubit, GetImageState>(
      builder: (context, state) {
        return ChatPageFriendDetails(
            textNumber: images.imageList.length.toString(),
            textType: 'Public Post');
      },
    );
  }
}
