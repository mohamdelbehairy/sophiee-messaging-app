import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/utils/widget/flutter_toast_widget.dart';
import 'package:sophiee/utils/widget/media/save_image.dart';
import 'package:sophiee/utils/widget/media/share_media.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconSettingsGroupImage extends StatelessWidget {
  const IconSettingsGroupImage(
      {super.key, required this.size, required this.groupModel});

  final Size size;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        color: Colors.white12,
        offset: const Offset(10, 50),
        icon: Icon(FontAwesomeIcons.ellipsisVertical,
            color: Colors.white, size: size.height * .025),
        itemBuilder: (context) => [
              PopupMenuItem(
                  child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                  await saveImage(imageUrl: groupModel.groupImage!);
                  FlutterToastWidget.showToast(msg: "image saved successfully");
                },
                child: Row(
                  children: [
                    Icon(Icons.bookmark_add,
                        size: size.width * .05, color: Colors.white),
                    SizedBox(width: size.width * .025),
                    const Text('Save to gallery',
                        style: TextStyle(color: Colors.white))
                  ],
                ),
              )),
              PopupMenuItem(
                  child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                  await shareMedia(
                      mediaUrl: groupModel.groupImage!, mediaType: 'image.jpg');
                },
                child: Row(
                  children: [
                    Icon(Icons.share,
                        size: size.width * .04, color: Colors.white),
                    SizedBox(width: size.width * .025),
                    const Text('Share image',
                        style: TextStyle(color: Colors.white))
                  ],
                ),
              )),
            ]);
  }
}
