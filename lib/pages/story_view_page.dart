import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:sophiee/cubit/story/story_cubit.dart';
import 'package:sophiee/cubit/story/story_state.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/story_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_view/story_view.dart';

import '../cubit/auth/login/login_cubit.dart';

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

    return BlocBuilder<StoryCubit, StoryState>(builder: (context, state) {
      if (state is GetStorySuccess) {
        List<StoryModel> stories = state.stories;
        return Scaffold(
          body: Material(
            child: Stack(
              children: [
                StoryView(
                  storyItems: stories.map(
                    (url) {
                      if (url.storyImage != null) {
                        return StoryItem.pageImage(
                            caption: Text(url.storyText,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            url: url.storyImage!,
                            controller: controller);
                      } else if (url.storyVideo != null) {
                        return StoryItem.pageVideo(
                          duration:  Duration(seconds: url.storyVideoTime!),
                            caption: Text(url.storyText,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            url.storyVideo!,
                            controller: controller);
                      }
                    },
                  ).toList(),
                  controller: controller,
                  inline: true,
                  repeat: false,
                  onComplete: () => Navigator.pop(context),
                  onVerticalSwipeComplete: (dir) {
                    if (dir == Direction.down) {
                      Navigator.pop(context);
                    }
                  },
                ),
                BlocBuilder<GetUserDataCubit, GetUserDataStates>(
                  builder: (context, state) {
                    if (state is GetUserDataSuccess &&
                        state.userModel.isNotEmpty) {
                      final userData = state.userModel.firstWhere(
                          (element) => element.userID == widget.userID);
                      return Positioned(
                        top: 40,
                        left: 12,
                        child: SizedBox(
                          height: size.height * .08,
                          width: size.width,
                          child: ListTile(
                            title: Text(userData.userName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(size.width * .15),
                                  child: FancyShimmerImage(
                                      boxFit: BoxFit.cover,
                                      shimmerBaseColor: isDark
                                          ? Colors.white12
                                          : Colors.grey.shade300,
                                      shimmerHighlightColor: isDark
                                          ? Colors.white24
                                          : Colors.grey.shade100,
                                      imageUrl: userData.profileImage),
                                )),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
