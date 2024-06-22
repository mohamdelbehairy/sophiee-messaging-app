import 'package:get/get.dart' as getnav;
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';
import 'package:sophiee/cubit/pick_video/pick_video_cubit.dart';
import 'package:sophiee/cubit/pick_video/pick_video_state.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_image.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_bottom_sheet_item.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'add_story_live.dart';

class AddStoryBottomSheet extends StatelessWidget {
  const AddStoryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pickImage = context.read<PickImageCubit>();
    final pickVideo = context.read<PickVideoCubit>();

    return BlocListener<PickVideoCubit, PickVideoState>(
      listener: (context, state) {
        if (state is PickVideoSuccess) {
          getnav.Get.to(() => AddStoryVideo(video: state.video),
              transition: getnav.Transition.downToUp);
        }
      },
      child: BlocListener<PickImageCubit, PickImageStates>(
        listener: (context, state) {
          if (state is PickImageSucccess) {
            getnav.Get.to(() => AddStoryImage(image: state.image),
                transition: getnav.Transition.downToUp);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(size.width * .03),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AddStoryBottomSheetItem(
                  text: 'add image',
                  icon: Icons.camera_alt_rounded,
                  onTap: () async {
                    Navigator.pop(context);
                    await pickImage.pickImage(source: ImageSource.gallery);
                  }),
              const SizedBox(height: 12),
              AddStoryBottomSheetItem(
                  text: 'add video',
                  icon: Icons.video_collection,
                  onTap: () async {
                     Navigator.pop(context);
                    await pickVideo.pickVideo(source: ImageSource.gallery);
                  }),
              const SizedBox(height: 12),
              const AddStoryLive(),
            ],
          ),
        ),
      ),
    );
  }
}
