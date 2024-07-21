import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';
import 'package:sophiee/cubit/pick_video/pick_video_cubit.dart';
import 'package:sophiee/cubit/pick_video/pick_video_state.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart' as getnav;

import 'add_story_image.dart';
import 'add_story_video.dart';

class AddStory extends StatelessWidget {
  const AddStory({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return BlocListener<PickImageCubit, PickImageStates>(
      listener: (context, state) {
        if (state is PickImageSucccess) {
          getnav.Get.to(() => AddStoryImage(image: state.image),
              transition: getnav.Transition.downToUp);
        }
      },
      child: BlocListener<PickVideoCubit, PickVideoState>(
        listener: (context, state) {
          if (state is PickVideoSuccess) {
            getnav.Get.to(() => AddStoryVideo(video: state.video),
                transition: getnav.Transition.downToUp);
          }
        },
        child: Column(
          children: [
            GestureDetector(
              onTap: () => showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => Container(
                      decoration: BoxDecoration(
                          color:
                              isDark ? const Color(0xff2b2c33) : Colors.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                      child: AddStoryBottomSheet(isDark: isDark))),
              child: CircleAvatar(
                radius: size.height * .031,
                backgroundColor: isDark
                    ? const Color(0xff4a4b50)
                    : Colors.grey.withOpacity(.15),
                child: Icon(Icons.add,
                    color: isDark ? const Color(0xffd2d1d8) : Colors.grey),
              ),
            ),
            SizedBox(height: size.width * .02),
            Text('Your Story',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black))
          ],
        ),
      ),
    );
  }
}
