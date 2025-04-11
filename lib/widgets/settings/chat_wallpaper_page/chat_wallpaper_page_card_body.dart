import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';
import 'package:sophiee/utils/navigation.dart';

import '../../../constants.dart';
import '../../../pages/setting/chat_wall_paper_pick_image_page.dart';
import 'chat_wall_paper_set_color.dart';
import 'chat_wall_paper_upload_image.dart';
import 'reset_defaults.dart';

class ChatWallPaperPageCardBody extends StatelessWidget {
  const ChatWallPaperPageCardBody(
      {super.key, required this.size, required this.isDark});
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    var pickImage = context.read<PickImageCubit>();
    return BlocListener<PickImageCubit, PickImageStates>(
      listener: (context, state) {
        if (state is PickImageSucccess) {
          Navigation.push(context,
              ChatWallPaperPickImagePage(imageFile: state.image, size: size));
        }
      },
      child: Card(
        color: isDark ? cardDarkModeBackground : Colors.white,
        elevation: isDark ? 1 : 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
            padding:
                const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 4),
            child: Column(
              children: [
                ChatWallPaperUploadImage(
                    size: size, isDark: isDark, pickImage: pickImage),
                const SizedBox(height: 4),
                ChatWallPaperSetColor(size: size, isDark: isDark),
                const SizedBox(height: 4),
                ChatWallPaperResetDefaults(size: size, isDark: isDark)
              ],
            )),
      ),
    );
  }
}
