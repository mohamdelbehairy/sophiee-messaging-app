import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/models/floating_action_button_model.dart';

import '../../../cubit/auth/login/login_cubit.dart';
import '../../../cubit/pick_video/pick_video_cubit.dart';
import 'my_story_page_floating_action_button_item.dart';

class MyStoryPageFloatingActionButtonBody extends StatelessWidget {
  const MyStoryPageFloatingActionButtonBody({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    var pickImage = context.read<PickImageCubit>();
    var pickVideo = context.read<PickVideoCubit>();

    return ExpandableFab(
      openButtonBuilder: DefaultFloatingActionButtonBuilder(
          backgroundColor: kPrimaryColor,
          fabSize: ExpandableFabSize.regular,
          child: const Icon(Icons.menu, color: Colors.white)),
      closeButtonBuilder: DefaultFloatingActionButtonBuilder(
          backgroundColor: kPrimaryColor,
          fabSize: ExpandableFabSize.regular,
          child: const Icon(Icons.close, color: Colors.white)),
      children: [
        MyStoryPageFloatingActionItem(
            floatingActionButtonModel: FloatingActionButtonModel(
                isDark: isDark,
                heroTag: 'uniqueTag1',
                icon: Icons.camera_alt,
                onTap: () async =>
                    await pickImage.pickImage(source: ImageSource.gallery))),
        MyStoryPageFloatingActionItem(
            floatingActionButtonModel: FloatingActionButtonModel(
                isDark: isDark,
                heroTag: 'uniqueTag2',
                icon: Icons.collections,
                onTap: () async =>
                    await pickVideo.pickVideo(source: ImageSource.gallery))),
      ],
    );
  }
}
