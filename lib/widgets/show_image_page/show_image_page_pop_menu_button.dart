import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/cubit/user_date/image/delete_image/delete_image_cubit.dart';
import 'package:sophiee/models/image_model.dart';
import 'package:sophiee/utils/widget/media/save_image.dart';

import '../../constants.dart';
import '../../utils/custom_show_dialog.dart';
import '../../utils/widget/flutter_toast_widget.dart';
import '../../utils/widget/media/share_media.dart';
import '../../utils/widget/pop_menu_info_item.dart';

class ShowImagePagePopMenuButton extends StatelessWidget {
  const ShowImagePagePopMenuButton(
      {super.key, required this.size, required this.imageModel});

  final Size size;
  final ImageModel imageModel;

  @override
  Widget build(BuildContext context) {
    var deleteImage = context.read<DeleteImageCubit>();
    return PopupMenuButton(
        color: Colors.white12,
        offset: const Offset(10, 50),
        icon: Icon(FontAwesomeIcons.ellipsisVertical,
            color: Colors.white, size: size.width * .05),
        itemBuilder: (context) => [
              groupsInfoPopMenuItem(
                  onTap: () async {
                    await saveImage(imageUrl: imageModel.imageUrl);
                    FlutterToastWidget.showToast(
                        msg: "Image saved successfully");
                  },
                  itemName: 'Save to gallery',
                  size: size,
                  icon: Icons.save_alt_outlined),
              groupsInfoPopMenuItem(
                  onTap: () async {
                    await shareMedia(
                        mediaUrl: imageModel.imageUrl, mediaType: 'image.jpg');
                  },
                  itemName: 'Share image',
                  size: size,
                  icon: Icons.share),
              if (imageModel.userID == FirebaseAuth.instance.currentUser!.uid)
                groupsInfoPopMenuItem(
                    onTap: () async {
                      customShowDialog(
                          context: context,
                          doneButtonText: 'Ok',
                          backgroundColor: kPrimaryColor,
                          contentText: 'Are you sure to delete image?',
                          okFunction: () async {
                            Navigator.pop(context);
                            await deleteImage.deleteImage(
                                imageID: imageModel.imageID);
                          });
                    },
                    itemName: 'Delete image',
                    size: size,
                    icon: FontAwesomeIcons.trash)
            ]);
  }
}
