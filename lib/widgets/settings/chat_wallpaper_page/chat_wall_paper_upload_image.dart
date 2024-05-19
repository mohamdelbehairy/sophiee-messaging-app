import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';

import '../custom_items_two.dart';

class ChatWallPaperUploadImage extends StatelessWidget {
  const ChatWallPaperUploadImage(
      {super.key,
      required this.size,
      required this.isDark,
      required this.pickImage});

  final Size size;
  final bool isDark;
  final PickImageCubit pickImage;

  @override
  Widget build(BuildContext context) {
    return CustomItemsTwo(
        color: Colors.indigoAccent.shade400,
        icon: Icons.add_a_photo_outlined,
        icon2: FontAwesomeIcons.chevronRight,
        iconSize: size.width * .045,
        text: 'Upload Wallpaper',
        size: size,
        textColor: isDark ? Colors.white : Colors.black,
        onTap: () async {
          await pickImage.pickImage(source: ImageSource.gallery);
        });
  }
}
