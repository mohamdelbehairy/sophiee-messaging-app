import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/user_date/get_user_data/get_user_data_cubit.dart';
import '../../../cubit/user_date/get_user_data/get_user_data_state.dart';
import '../../../utils/widget/story_page/show_story_publish_info_body.dart';

class ShowStoryPublishInfo extends StatelessWidget {
  const ShowStoryPublishInfo(
      {super.key,
      required this.userID,
      required this.size,
      required this.isDark});

  final String userID;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final userData =
              state.userModel.firstWhere((element) => element.userID == userID);
          return ShowStoryPublishInfoBody(
              size: size,
              title: userData.userName,
              imageUrl: userData.profileImage,
              isDark: isDark);
        } else {
          return Container();
        }
      },
    );
  }
}
