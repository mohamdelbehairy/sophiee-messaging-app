import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/story/story_cubit.dart';
import 'package:sophiee/cubit/story/story_state.dart';

import 'my_story_page_list_tile.dart';

class MyStoryPageBody extends StatelessWidget {
  const MyStoryPageBody({super.key, required this.size, required this.isDark});
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryCubit, StoryState>(builder: (context, state) {
      if (state is GetStorySuccess) {
        return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.stories.length,
            itemBuilder: (context, index) {
              int differenceInMinutes = Timestamp.now()
                  .toDate()
                  .difference(state.stories[index].storyDataTime)
                  .inMinutes;
              int differenceInHours = Timestamp.now()
                  .toDate()
                  .difference(state.stories[index].storyDataTime)
                  .inHours;
              return MyStoryPageListTile(
                  size: size,
                  isDark: isDark,
                  index: index,
                  storyModel: state.stories[index],
                  differenceInMinutes: differenceInMinutes,
                  differenceInHours: differenceInHours);
            });
      } else {
        return const SizedBox();
      }
    });
  }
}
