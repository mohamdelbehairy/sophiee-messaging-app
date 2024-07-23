import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart' as getnav;
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';
import 'package:sophiee/cubit/story/story_cubit.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_image.dart';
import 'package:sophiee/widgets/all_chats_page/my_story_page/my_story_page_floating_action_button.dart';

import '../../widgets/all_chats_page/my_story_page/my_story_app_bar.dart';
import '../../widgets/all_chats_page/my_story_page/my_story_page_body.dart';

class MyStoryPage extends StatefulWidget {
  const MyStoryPage({super.key});

  @override
  State<MyStoryPage> createState() => _MyStoryPageState();
}

class _MyStoryPageState extends State<MyStoryPage> {
  @override
  void initState() {
    context
        .read<StoryCubit>()
        .getStory(friendId: FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var isDark = context.read<LoginCubit>().isDark;
    return Scaffold(
      appBar: myStoryAppBar(size),
      body: MyStoryPageBody(size: size, isDark: isDark),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: BlocListener<PickImageCubit, PickImageStates>(
        listener: (context, state) {
          if (state is PickImageSucccess) {
            getnav.Get.to(() => AddStoryImage(image: state.image),
                transition: getnav.Transition.rightToLeft);
          }
        },
        child: const MyStoryPageFloatingActionButton(),
      ),
    );
  }
}
