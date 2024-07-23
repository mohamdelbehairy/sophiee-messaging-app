import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/story_model.dart';

import '../../cubit/auth/login/login_cubit.dart';
import '../../utils/widget/story_page/show_story_publish_info.dart';
import '../../widgets/all_chats_page/my_story_page/my_story_page_widget.dart';

class ShowMyStoryPage extends StatelessWidget {
  const ShowMyStoryPage({super.key, required this.storyModel});
  final StoryModel storyModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var isDark = context.read<LoginCubit>().isDark;
    return Scaffold(
      body: Material(
        color: Colors.black,
        child: Stack(
          children: [
            MyStoryPageWidget(storyModel: storyModel),
            BlocBuilder<GetUserDataCubit, GetUserDataStates>(
              builder: (context, state) {
                if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
                  final userData = state.userModel.firstWhere((element) =>
                      element.userID == FirebaseAuth.instance.currentUser!.uid);
                  return ShowStoryPublishInfo(
                      size: size,
                      title: 'My status',
                      imageUrl: userData.profileImage,
                      isDark: isDark);
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
