import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';
import 'package:sophiee/cubit/pick_video/pick_video_cubit.dart';
import 'package:sophiee/cubit/pick_video/pick_video_state.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_image.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_popover_item.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddStoryPopover extends StatelessWidget {
  const AddStoryPopover({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pickImage = context.read<PickImageCubit>();
    final pickVideo = context.read<PickVideoCubit>();

    return BlocListener<PickVideoCubit, PickVideoState>(
      listener: (context, state) {
        if (state is PickVideoSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddStoryVideo(video: state.video),
            ),
          );
        }
      },
      child: BlocListener<PickImageCubit, PickImageStates>(
        listener: (context, state) {
          if (state is PickImageSucccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddStoryImage(image: state.image),
              ),
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.all(size.width * .03),
          child: Column(
            children: [
              AddStoryPopoverItem(
                  text: 'photo',
                  icon: Icons.camera_alt_rounded,
                  onTap: () {
                    pickImage.pickImage(source: ImageSource.gallery);
                  }),
              SizedBox(height: size.height * .01),
              AddStoryPopoverItem(
                  text: 'video',
                  icon: Icons.video_collection,
                  onTap: () {
                    pickVideo.pickVideo(source: ImageSource.gallery);
                  }),
              SizedBox(height: size.height * .01),
              AddStoryPopoverItem(
                  text: 'live', icon: FontAwesomeIcons.youtube, onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
