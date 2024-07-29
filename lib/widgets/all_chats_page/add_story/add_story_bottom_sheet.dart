import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_video/pick_video_cubit.dart';
import 'package:sophiee/widgets/all_chats_page/add_story/add_story_bottom_sheet_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'add_story_live.dart';

class AddStoryBottomSheet extends StatelessWidget {
  const AddStoryBottomSheet({super.key, required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pickImage = context.read<PickImageCubit>();
    final pickVideo = context.read<PickVideoCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .05),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: size.width * .1, child: const Divider(thickness: 5)),
          SizedBox(height: size.height * .01),
          Text('Add a new story',
              style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: size.width * .042)),
          SizedBox(height: size.height * .015),
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
          SizedBox(height: size.height * .015),
        ],
      ),
    );
  }
}
