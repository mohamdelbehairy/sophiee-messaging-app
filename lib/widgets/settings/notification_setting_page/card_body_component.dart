import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/update_user_data/update_user_cubit_cubit.dart';
import 'package:sophiee/models/users_model.dart';

import '../../all_chats_page/groups_page/groups_chat_page/groups_permissions_page/custom_switch_icon.dart';
import '../custom_items_two.dart';

class CardBodyComponent extends StatelessWidget {
  const CardBodyComponent(
      {super.key,
      required this.size,
      required this.isDark,
      required this.userData});

  final Size size;
  final bool isDark;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    var updateNotify = context.read<UpdateUserDataCubit>();
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 20, bottom: 4),
      child: Column(
        children: [
          CustomItemsTwo(
              color: Colors.indigoAccent.shade400,
              icon: Icons.person_outline,
              widget: CustomSwitchIcon(
                  size: size,
                  onChanged: (value) async {
                    await updateNotify.updateNotifyField(
                        fieldName: 'isChatNotify', fieldValue: value);
                  },
                  value: userData.isChatNotify),
              iconSize: size.width * .05,
              text: 'Private Chats',
              textColor: isDark ? Colors.white : Colors.black,
              size: size),
          const SizedBox(height: 8),
          CustomItemsTwo(
              color: kPrimaryColor,
              icon: Icons.group_outlined,
              widget: CustomSwitchIcon(
                  size: size,
                  onChanged: (value) async {
                    await updateNotify.updateNotifyField(
                        fieldName: 'isGroupNotify', fieldValue: value);
                  },
                  value: userData.isGroupNotify),
              iconSize: size.width * .05,
              text: 'Groups',
              textColor: isDark ? Colors.white : Colors.black,
              size: size),
          const SizedBox(height: 8),
          CustomItemsTwo(
              color: const Color(0xffB338E0),
              icon: Icons.play_arrow_outlined,
              widget: CustomSwitchIcon(
                  size: size,
                  onChanged: (value) async {
                    await updateNotify.updateNotifyField(
                        fieldName: 'isStoryNotify', fieldValue: value);
                  },
                  value: userData.isStoryNotify),
              iconSize: size.width * .06,
              text: 'Stories',
              textColor: isDark ? Colors.white : Colors.black,
              size: size),
          const SizedBox(height: 8),
          CustomItemsTwo(
              color: Colors.orange,
              icon: FontAwesomeIcons.youtube,
              widget: CustomSwitchIcon(
                  size: size,
                  onChanged: (value) async {
                    await updateNotify.updateNotifyField(
                        fieldName: 'isLivesNotify', fieldValue: value);
                  },
                  value: userData.isLivesNotify),
              iconSize: size.width * .04,
              text: 'Lives',
              textColor: isDark ? Colors.white : Colors.black,
              size: size),
          const SizedBox(height: 8),
          CustomItemsTwo(
              color: Colors.pink.shade400,
              icon: FontAwesomeIcons.message,
              widget: CustomSwitchIcon(
                  size: size,
                  onChanged: (value) async {
                    await updateNotify.updateNotifyField(
                        fieldName: 'isPinnedMessageNotify', fieldValue: value);
                  },
                  value: userData.isPinnedMessageNotify),
              iconSize: size.width * .04,
              text: 'Pinned Messages',
              textColor: isDark ? Colors.white : Colors.black,
              size: size),
        ],
      ),
    );
  }
}
