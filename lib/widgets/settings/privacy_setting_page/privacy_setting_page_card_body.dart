import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/cubit/update_user_data/update_user_cubit_cubit.dart';
import 'package:sophiee/models/users_model.dart';

import '../../../constants.dart';
import '../../../cubit/auth/login/login_cubit.dart';
import '../../all_chats_page/groups_page/groups_chat_page/groups_permissions_page/custom_switch_icon.dart';
import '../custom_items_two.dart';

class PrivacySettingPageCardBody extends StatelessWidget {
  const PrivacySettingPageCardBody(
      {super.key, required this.size, required this.userData});
  final Size size;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    var updateField = context.read<UpdateUserDataCubit>();
    return Card(
      color: isDark ? cardDarkModeBackground : Colors.white,
      elevation: isDark ? 1 : 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, right: 20, bottom: 4),
        child: Column(
          children: [
            CustomItemsTwo(
                color: Colors.indigoAccent.shade400,
                icon: Icons.app_registration_outlined,
                widget: CustomSwitchIcon(
                    size: size,
                    onChanged: (value) async {
                      await updateField.updateField(
                          fieldName: 'isPhoneAndEmail', fieldValue: value);
                    },
                    value: userData.isPhoneAndEmail),
                iconSize: size.width * .05,
                text: 'Phone Number & Email',
                textColor: isDark ? Colors.white : Colors.black,
                size: size),
            const SizedBox(height: 8),
            CustomItemsTwo(
                color: kPrimaryColor,
                icon: Icons.group_outlined,
                widget: CustomSwitchIcon(
                    size: size,
                    onChanged: (value) async {
                      await updateField.updateField(
                          fieldName: 'isLastSeendAndOnline', fieldValue: value);
                    },
                    value: userData.isLastSeendAndOnline),
                iconSize: size.width * .05,
                text: 'Last Seen & online',
                textColor: isDark ? Colors.white : Colors.black,
                size: size),
            const SizedBox(height: 8),
            CustomItemsTwo(
                color: const Color(0xffB338E0),
                icon: Icons.photo_outlined,
                widget: CustomSwitchIcon(
                    size: size,
                    onChanged: (value) async {
                      await updateField.updateField(
                          fieldName: 'isProfilePhotos', fieldValue: value);
                    },
                    value: userData.isProfilePhotos),
                iconSize: size.width * .05,
                text: 'Profile Photos',
                textColor: isDark ? Colors.white : Colors.black,
                size: size),
            const SizedBox(height: 8),
            CustomItemsTwo(
                color: Colors.orange,
                icon: FontAwesomeIcons.solidCalendarDays,
                widget: CustomSwitchIcon(
                    size: size,
                    onChanged: (value) async {
                      await updateField.updateField(
                          fieldName: 'isDateOfBirth', fieldValue: value);
                    },
                    value: userData.isDateOfBirth),
                iconSize: size.width * .04,
                text: 'Date of Birth',
                textColor: isDark ? Colors.white : Colors.black,
                size: size),
            const SizedBox(height: 8),
            CustomItemsTwo(
                color: const Color(0xfffe6e6e),
                icon: FontAwesomeIcons.circleInfo,
                widget: CustomSwitchIcon(
                    size: size,
                    onChanged: (value) async {
                      await updateField.updateField(
                          fieldName: 'isBioAndNickName', fieldValue: value);
                    },
                    value: userData.isBioAndNickName),
                iconSize: size.width * .04,
                text: 'Bio & Nickname',
                textColor: isDark ? Colors.white : Colors.black,
                size: size),
            const SizedBox(height: 8),
            CustomItemsTwo(
                color: Colors.pink.shade400,
                icon: FontAwesomeIcons.phone,
                widget: CustomSwitchIcon(
                    size: size,
                    onChanged: (value) async {
                      await updateField.updateField(
                          fieldName: 'isAudioAndVideoCall', fieldValue: value);
                    },
                    value: userData.isAudioAndVideoCall),
                iconSize: size.width * .04,
                text: 'Audio & Video calls',
                textColor: isDark ? Colors.white : Colors.black,
                size: size),
          ],
        ),
      ),
    );
  }
}
