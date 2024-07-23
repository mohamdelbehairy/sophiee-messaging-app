import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/story/story_cubit.dart';
import 'package:sophiee/cubit/story/story_state.dart';

import '../../../constants.dart';
import '../../../utils/widget/loading_animation_circle_indicator.dart';
import '../../../utils/widget/no_result_found.dart';
import 'my_story_page_list_tile.dart';

class MyStoryPageBody extends StatelessWidget {
  const MyStoryPageBody({super.key, required this.size, required this.isDark});
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    var stories = context.read<StoryCubit>();
    return BlocBuilder<StoryCubit, StoryState>(builder: (context, state) {
      if (state is GetStoryLoading) {
        return LoadingAnimationCircleIndicator(size: size);
      }

      if (stories.stories.isNotEmpty) {
        return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: stories.stories.length,
            itemBuilder: (context, index) {
              int differenceInMinutes = Timestamp.now()
                  .toDate()
                  .difference(stories.stories[index].storyDataTime)
                  .inMinutes;
              int differenceInHours = Timestamp.now()
                  .toDate()
                  .difference(stories.stories[index].storyDataTime)
                  .inHours;
              return MyStoryPageListTile(
                  size: size,
                  isDark: isDark,
                  index: index,
                  storyModel: stories.stories[index],
                  differenceInMinutes: differenceInMinutes,
                  differenceInHours: differenceInHours);
            });
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomNoResultFound(
                height: size.height * .35,
                image: searchFriendsImageUrl,
                textOne: '',
                textTwo: ''),
          ],
        );
      }
    });
  }
}
