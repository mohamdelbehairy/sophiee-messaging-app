import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_bottom_icons_bottom_sheet.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_top_icons_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsChatPageBottomSheetIcons extends StatelessWidget {
  const GroupsChatPageBottomSheetIcons({super.key, required this.groupModel});
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .3,
      width: size.width * .9,
      child: Card(
        color: isDark ? Colors.black87 : Colors.white,
        margin: EdgeInsets.all(size.width * .065),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.width * .04),
          child: Column(
            children: [
              GroupsChatPageTopIconsBottomSheet(groupModel: groupModel),
              SizedBox(height: size.height * .01),
              const GroupChatBottomIconsBottomSheet(),
            ],
          ),
        ),
      ),
    );
  }
}
