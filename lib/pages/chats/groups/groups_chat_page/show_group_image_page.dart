import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/show_group_image_page/icon.settings_group_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShowGroupImagePage extends StatelessWidget {
  const ShowGroupImagePage(
      {super.key, required this.groupModel, required this.size});
  final GroupModel groupModel;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Group image',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * .055,
                  fontWeight: FontWeight.normal)),
          actions: [
            IconSettingsGroupImage(size: size, groupModel: groupModel)
          ]),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.only(top: size.width * .2),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(groupModel.groupImage!),
                fit: BoxFit.fitWidth)),
      )),
    );
  }
}
