import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_cubit.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/bottom_sheet/icons_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupChatBottomIconsBottomSheet extends StatelessWidget {
  const GroupChatBottomIconsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pickContact = context.read<PickContactCubit>();
    navigation() {
      Navigation.pop(context);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconBottomSheet(
            onTap: () {},
            text: 'Audio',
            color: Colors.orange,
            icon: Icons.headset),
        SizedBox(width: size.width * .08),
        CustomIconBottomSheet(
            onTap: () {},
            text: 'Location',
            color: Colors.pink,
            icon: Icons.location_pin),
        SizedBox(width: size.width * .08),
        CustomIconBottomSheet(
            onTap: () async {
              await pickContact.pickContact();
              navigation();
            },
            text: 'Contact',
            color: Colors.blue,
            icon: Icons.person)
      ],
    );
  }
}
