import 'package:sophiee/cubit/story/story_cubit.dart';
import 'package:sophiee/cubit/story/story_state.dart';
import 'package:sophiee/models/story_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_view/story_view.dart';

import '../../cubit/auth/login/login_cubit.dart';
import '../../widgets/all_chats_page/story_view_page/story_view_page_body.dart';

class StoryViewPage extends StatefulWidget {
  const StoryViewPage({super.key, required this.userID});
  final String userID;

  @override
  State<StoryViewPage> createState() => _StoryViewPageState();
}

class _StoryViewPageState extends State<StoryViewPage> {
  final StoryController controller = StoryController();

  @override
  void initState() {
    super.initState();
    context.read<StoryCubit>().getStory(friendId: widget.userID);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isDark = context.read<LoginCubit>().isDark;
    var stories = context.read<StoryCubit>();

    return BlocBuilder<StoryCubit, StoryState>(builder: (context, state) {
      List<StoryModel> story = stories.stories;
      return Scaffold(
        body: StoryViewPageBody(
            story: story,
            controller: controller,
            widget: widget,
            size: size,
            isDark: isDark),
      );
    });
  }
}

