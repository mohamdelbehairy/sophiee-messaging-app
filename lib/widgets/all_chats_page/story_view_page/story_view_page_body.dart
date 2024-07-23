import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_view/story_view.dart';

import '../../../cubit/user_date/get_user_data/get_user_data_cubit.dart';
import '../../../cubit/user_date/get_user_data/get_user_data_state.dart';
import '../../../models/story_model.dart';
import '../../../pages/story/story_view_page.dart';
import '../../../utils/widget/story_page/show_story_publish_info.dart';
import 'story_view_widget.dart';

class StoryViewPageBody extends StatelessWidget {
  const StoryViewPageBody(
      {super.key,
      required this.story,
      required this.controller,
      required this.widget,
      required this.size,
      required this.isDark});

  final List<StoryModel> story;
  final StoryController controller;
  final StoryViewPage widget;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          StoryViewWidget(story: story, controller: controller),
          BlocBuilder<GetUserDataCubit, GetUserDataStates>(
            builder: (context, state) {
              if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
                final userData = state.userModel
                    .firstWhere((element) => element.userID == widget.userID);
                return ShowStoryPublishInfo(
                    size: size,
                    title: userData.userName,
                    imageUrl: userData.profileImage,
                    isDark: isDark);
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
