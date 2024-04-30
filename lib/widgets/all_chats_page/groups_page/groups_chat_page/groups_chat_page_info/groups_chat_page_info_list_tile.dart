import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_page/groups_chat_page_info_edit.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_page/show_group_image_page.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_info/groups_chat_page_info_list_tile_sub_title.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

class GroupsChatPageInfoListTile extends StatelessWidget {
  const GroupsChatPageInfoListTile({super.key, required this.groupModel});
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var isDark = context.read<LoginCubit>().isDark;
    return ListTile(
      leading: GestureDetector(
        onTap: () => getnav.Get.to(
            () => ShowGroupImagePage(groupModel: groupModel, size: size),
            transition: getnav.Transition.leftToRight),
        child: CircleAvatar(
          radius: size.height * .03,
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FancyShimmerImage(
                boxFit: BoxFit.cover,
                shimmerBaseColor:
                    isDark ? Colors.white12 : Colors.grey.shade300,
                shimmerHighlightColor:
                    isDark ? Colors.white24 : Colors.grey.shade100,
                imageUrl: groupModel.groupImage!),
          ),
        ),
      ),
      title: Row(
        children: [
          SizedBox(
              width: groupModel.groupName.length > 25 ? size.width * .5 : null,
              child: Text(groupModel.groupName,
                  maxLines: 1, overflow: TextOverflow.ellipsis)),
          SizedBox(width: size.width * .02),
          if (groupModel.isMemberSettings ||
              groupModel.groupOwnerID == FirebaseAuth.instance.currentUser!.uid)
            GestureDetector(
                onTap: () {
                  getnav.Get.to(
                      () => GroupsChatPageInfoEditPage(groupModel: groupModel),
                      transition: getnav.Transition.leftToRight);
                },
                child: Icon(Icons.edit,
                    color: Colors.grey, size: size.height * .022))
        ],
      ),
      subtitle: CustomSubTitle(groupModel: groupModel, size: size),
    );
  }
}
